class AppTask {
  String title;
  String description;
  DateTime dateTime;
  int color;
  AppTask(
      {required this.title,
      required this.description,
      required this.dateTime,
      required this.color});

  AppTask.fromJason(Map<String, dynamic> data)
      : this(
          title: data["title"],
          description: data["description"],
          color: data["color"],
          dateTime: DateTime.fromMillisecondsSinceEpoch(data["dateTime"]),
        );

  Map<String, dynamic> toJason() {
    return {
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'color': color
    };
  }
}
