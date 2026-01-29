import 'package:flutter/material.dart';
import 'package:todo_starter/main.dart';
import 'package:todo_starter/models/task_model.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';
import 'package:todo_starter/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final String geag = "";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final TextEditingController _titleController = TextEditingController();
   final TextEditingController _descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){


          //Show bottom sheet

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            builder:(context) {
             
              final mediaQuery = MediaQuery.of(context).viewInsets;

              print(mediaQuery.bottom);
              return Padding(
                padding: EdgeInsets.only(bottom:  mediaQuery.bottom),
                child: SizedBox(
                  width: double.infinity,
                  height: 700,
                  child: Column(
                    children: [
                      const SizedBox(height: 90,),
                      Text("Add Title",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            CustomTextfield(
                              prefix: Icons.task_alt,
                              hintText: "Task title",
                              controller: _titleController
                            ),
                            const SizedBox(height: 12,),
                            CustomTextfield(
                              prefix: Icons.task_alt,
                              hintText: "Task description",
                              controller: _descriptionController
                            ),
                            const SizedBox(
                              height: 40,
                              ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){

                                  final model = TaskModel(
                                    title: _titleController.text,
                                    description: _descriptionController.text,
                                    isCompleted: false,
                                    id: UniqueKey().toString(),
                                  );

                                  //call add task function
                                  vm.addTask(model);

                                  setState(() {
                                    
                                  });


                                  _titleController.clear();
                                  _descriptionController.clear();


                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  foregroundColor: Colors.white
                                ),
                                 child: Text("Add task")
                                 ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Todo Screen"),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){},
             icon: Icon(Icons.delete)
             ),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: vm.tasks.length,
        itemBuilder: (context, index) {
          final model = vm.tasks[index];
          return TaskItem(
            model: model,
            onRemove: (){

                // 
                final index = vm.tasks.indexWhere(
                  (task) => task.id == model.id
                );

                vm.deleteTask(index);

                setState(() {
                  
                });


},
          );
        },
      )
    );
  }
}