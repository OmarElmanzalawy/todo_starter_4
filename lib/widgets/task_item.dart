import 'package:flutter/material.dart';
import 'package:todo_starter/main.dart';
import 'package:todo_starter/models/task_model.dart';

//showModalBottomSheet

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.model,required this.onRemove});

  final TaskModel model;

  final VoidCallback onRemove;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(widget.model.title,style: TextStyle(fontWeight: FontWeight.bold),),
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
              subtitle: widget.model.description != null ? Text(widget.model.description!) : null,
              trailing: IconButton(
                onPressed: widget.onRemove, icon: Icon(Icons.remove)),
              tileColor: Colors.white,
              
            ),
          );
  }
}