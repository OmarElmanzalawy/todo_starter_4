import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_starter/models/task_model.dart';

class ViewModel {

  //States 

  List<TaskModel> tasks = [
    TaskModel(
      title: "First title",
      description: "description",
      isCompleted: true,
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
      id: "1138571208395723"
    ),
    TaskModel(
      title: "First title",
      description: "description",
      isCompleted: false,
      id: "12512"
    ),
  ];


  //Methods

  //CRUD

  void addTask(TaskModel task)async{
    
    //Modify list in place
    tasks.add(task);
    print(tasks.length);

    //Add to firestore
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection("users").doc(uid).collection("tasks").doc(task.id).set({
      "title": task.title,
      "description": task.description,
      "isCompleted": task.isCompleted,
      "id": task.id
    });

    //Return new list object
    //Spread operator
    // tasks = [...tasks, task];

  }

  void deleteTask(int index){

    tasks.removeAt(index);

  }

  void updateCompleteStatus(int index){

    final taskModel = tasks[index];

    taskModel.isCompleted = !taskModel.isCompleted;

  }

}