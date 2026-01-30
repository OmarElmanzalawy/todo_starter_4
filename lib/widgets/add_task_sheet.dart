import 'package:flutter/material.dart';
import 'package:todo_starter/main.dart';
import 'package:todo_starter/models/task_model.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).viewInsets;
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



                                  _titleController.clear();
                                  _descriptionController.clear();


                                  Navigator.pop(context, model);
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
  }
}