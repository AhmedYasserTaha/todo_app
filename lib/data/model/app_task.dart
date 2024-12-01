class AppTask {
  String title;
  String description;
  String id;
  DateTime dateTime;
  int color;
  AppTask({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.color,
    this.id = "",
  });

  AppTask.fromJason(Map<String, dynamic> data)
      : this(
          id: data['id'],
          title: data["title"],
          description: data["description"],
          color: data["color"],
          dateTime: DateTime.fromMillisecondsSinceEpoch(
            data["dateTime"],
          ),
        );

  Map<String, dynamic> toJason() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'color': color,
    };
  }
}
