import 'package:flutter/material.dart';

//showModalBottomSheet

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text("Task title",style: TextStyle(fontWeight: FontWeight.bold),),
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
              subtitle: Text("Task description"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
              tileColor: Colors.white,
              
            ),
          );
  }
}