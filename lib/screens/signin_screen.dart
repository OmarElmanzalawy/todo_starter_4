import 'package:flutter/material.dart';
import 'package:todo_starter/screens/signup_screen.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';


//Form widget
//

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _formKey,
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
                      "Sign in",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                    Text(
                      "Welcome back to our app",
                      style: TextStyle(color: Colors.grey.shade600),
                      ),
              
                      const SizedBox(height: 10,),
              
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 12,),
                            CustomTextfield(
                            prefix: Icons.email_outlined,
                            hintText: "Email",
                            controller: _emailController,
                            ),
                            const SizedBox(height: 12,),
                             CustomTextfield(
                            prefix: Icons.lock_outline,
                            hintText: "Password",
                            controller: _passwordController,
                            ),
              
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(8)
                                  )
                                ),
                                child: Text(
                                  "Sign In"
                                  )
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?"),
                                TextButton(onPressed: (){
                                  Navigator.push(
                                    context,
                                     MaterialPageRoute(
                                      builder:(context) {
                                        return SignupScreen();
                                      },
                                      )
                                     );
                                }, child: Text("Sign up"))
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