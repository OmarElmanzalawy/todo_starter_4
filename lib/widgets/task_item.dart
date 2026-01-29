import 'package:flutter/material.dart';
import 'package:todo_starter/models/task_model.dart';

//showModalBottomSheet

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.model});

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(model.title,style: TextStyle(fontWeight: FontWeight.bold),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(25)
              ),
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2
                  ),
                  shape: BoxShape.circle,
                  
                ),
              ),
              subtitle: model.description != null ? Text(model.description!) : null,
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
              tileColor: Colors.white,
              
            ),
          );
  }
}