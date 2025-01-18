class TaskModel {
  final String title;
  bool isDone;

  TaskModel({required this.title, this.isDone = false});

  void doneChande() {
    isDone = !isDone;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}
