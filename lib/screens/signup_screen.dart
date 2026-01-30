import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_starter/screens/home_screen.dart';
import 'package:todo_starter/screens/signin_screen.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.095,),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.deepPurple,
                    size: 100,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                    Text(
                      "Signup to get started with our app",
                      style: TextStyle(color: Colors.grey.shade600),
                      ),
              
                      const SizedBox(height: 10,),
              
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          children: [
                           CustomTextfield(
                            prefix: Icons.person_outline,
                            hintText: "Full Name",
                            controller: _fullNameController,
                            validator: (value) {
                              if(value == null || value!.isEmpty ){
                                return "name can't be empty";
                              }else{
                                return null;
                              }
                            },
                            ),
                            const SizedBox(height: 12,),
                            CustomTextfield(
                            prefix: Icons.email_outlined,
                            hintText: "Email",
                            controller: _emailController,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "email can't be empty";
                              }else if(!value.contains("@")){
                                return "Invalid email address";
                              }
                              
                            },
                            ),
                            const SizedBox(height: 12,),
                             CustomTextfield(
                            prefix: Icons.lock_outline,
                            hintText: "password",
                            controller: _passwordController,
                            validator: (value) {

                              if(value == null || value.isEmpty){
                                return "password can't be empty";
                              }else if(value.length < 7){
                                return "password can't be less than 7 characters";
                              }else if(_confirmPassword.text != value){
                                return "passwords do not match";
                              }
                            },
                            ),
                            const SizedBox(height: 12,),
                             CustomTextfield(
                            prefix: Icons.lock_outline,
                            hintText: "Confirm Password",
                            controller: _confirmPassword,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "password can't be empty";
                              }else if(value.length < 7){
                                return "password can't be less than 7 characters";
                              }else if(_passwordController.text != value){
                                return "passwords do not match";
                              }
                            },
                            ),
              
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: ()async{
              
                                  //Validate form
                                  final isValid = formKey.currentState!.validate();

                                  if(isValid){
                                    print("valid form");
                                    //sign up user

                                  try{

                                     final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text
                                    );
                                  
                                    final uid = user.user!.uid;
                                    //Store database

                                    await FirebaseFirestore.instance.collection("users").doc(uid).set({
                                      "email": _emailController.text,
                                      "name": _fullNameController.text
                                    });

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder:(context) => HomeScreen(),),
                                      (routes) => false
                                      );
                                  }on FirebaseAuthException catch(e){
                                    print(e.code);
                                    if(e.code == "email-already-in-use"){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Email already exists"))
                                        );
                                    }
                                  }
                                  catch(e){
                                    print(e.toString());
                                  }

                                  }
              
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(8)
                                  )
                                ),
                                child: Text(
                                  "Sign Up"
                                  )
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?"),
                                TextButton(onPressed: (){
                                  
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                     MaterialPageRoute(
                                      builder:(context) {
                                        return SigninScreen();
                                      },
                                      ),
                                      (predicate) => false
                                     );
                                }, child: Text("Sign in"))
                              ],
                            )
                          ],
                        ),
                      )
              
              
                ],
              ),
            ),
          ),
        )
      );
  }
}