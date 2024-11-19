class AppUsers {
  String name;
  String email;
  AppUsers({required this.name, required this.email});

  Map<String, dynamic> toJason() {
    return {"name": name, "email": email};
  }

  AppUsers.fromJason(Map<String, dynamic> data)
      : this(name: data["name"], email: data["email"]);
}
