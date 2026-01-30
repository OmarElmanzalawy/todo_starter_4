import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_starter/models/task_model.dart';

class ViewModel {

  //States 

  List<TaskModel> tasks = [];


  //Methods

  Future<void> getTasks()async{

    final uid = FirebaseAuth.instance.currentUser!.uid;

    final snapshot = await FirebaseFirestore.instance.collection("users").doc(uid).collection("tasks").get();

    final models = snapshot.docs.map((doc) {
      final map = doc.data();
      return TaskModel(
        title: map["title"],
        description: map["description"],
        isCompleted: map["isCompleted"],
        id: map["id"]
        );
    }).toList();

    tasks = models;

  }

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


  }

  Future<void> deleteTask(int index)async{

    print(tasks);
    print(index);
    print(tasks[index].id);

    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection("users").doc(uid).collection("tasks").doc(tasks[index].id)
    .delete();
    tasks.removeAt(index);
    
    

  }

  void updateCompleteStatus(int index)async{

    final taskModel = tasks[index];

    taskModel.isCompleted = !taskModel.isCompleted;

    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection("users").doc(uid)
    .collection("tasks").doc(taskModel.id).update({
      "isCompleted": taskModel.isCompleted,
    });

  }

}