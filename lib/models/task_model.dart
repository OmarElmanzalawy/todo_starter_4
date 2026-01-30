class TaskModel {

  final String id;
  bool isCompleted;
  final String title;
  final String? description;

  TaskModel({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.id
  });

}