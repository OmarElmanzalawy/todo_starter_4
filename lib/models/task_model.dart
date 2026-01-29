class TaskModel {

  final String id;
  final bool isCompleted;
  final String title;
  final String? description;

  TaskModel({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.id
  });

}