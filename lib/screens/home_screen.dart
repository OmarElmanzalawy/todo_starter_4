import 'package:flutter/material.dart';
import 'package:todo_starter/models/task_model.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';
import 'package:todo_starter/widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<TaskModel> tasks = [
    TaskModel(
      title: "First title",
      description: "description",
      isCompleted: false,
      id: "123"
    ),
    TaskModel(
      title: "Second title",
      description: "second description",
      isCompleted: true,
      id: "19u4"
    ),
    TaskModel(
      title: "First title",
      description: "description",
      isCompleted: false,
      id: "123"
    ),
    TaskModel(
      title: "First title",
      description: "description",
      isCompleted: false,
      id: "123"
    ),
  ];

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
              final TextEditingController _titleController = TextEditingController();
              final TextEditingController _descriptionController = TextEditingController();
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
                              hintText: "Task title",
                              controller: _descriptionController
                            ),
                            const SizedBox(
                              height: 40,
                              ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){
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
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskItem(
            model: tasks[index],
          );
        },
      )
    );
  }
}