import 'package:flutter/material.dart';
import 'package:todo_starter/widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
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
      body: ListView(
        padding: EdgeInsets.only(top: 20),
        children: [
          TaskItem(),
          TaskItem(),
          TaskItem(),
        ],
      )
    );
  }
}