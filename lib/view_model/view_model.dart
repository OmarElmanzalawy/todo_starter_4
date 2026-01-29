import 'package:todo_starter/models/task_model.dart';

class ViewModel {

  //States 

  List<TaskModel> tasks = [
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


  //Methods

  //CRUD

  void addTask(TaskModel task){
    
    //Modify list in place
    tasks.add(task);
    print(tasks.length);

    //Return new list object
    //Spread operator
    // tasks = [...tasks, task];


  }

}