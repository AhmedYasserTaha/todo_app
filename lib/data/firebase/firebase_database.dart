import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/data/model/app_task.dart';
import 'package:todo_app/data/model/app_users.dart';

class FirebaseDatabase {
  static CollectionReference<AppUsers> getCollection() {
    return FirebaseFirestore.instance
        .collection("users")
        .withConverter<AppUsers>(
          fromFirestore: (snapshot, options) =>
              AppUsers.fromJason(snapshot.data()!),
          toFirestore: (value, options) => value.toJason(),
        );
  }

  static Future<void> createUser(AppUsers user) async {
    var token = FirebaseAuth.instance.currentUser!.uid;
    return await getCollection().doc(token).set(user);
  }

  static Future<AppUsers?> getUser() async {
    var token = FirebaseAuth.instance.currentUser!.uid;
    var snapShot = await getCollection().doc(token).get();
    AppUsers? user = snapShot.data();
    return user;
  }

  static CollectionReference<AppTask> getcollectionTasks() {
    var token = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance
        .collection("users")
        .doc(token)
        .collection("task")
        .withConverter(
          fromFirestore: (snapshot, options) =>
              AppTask.fromJason(snapshot.data()!),
          toFirestore: (appTask, options) => appTask.toJason(),
        );
  }

  static Future<void> addTask(AppTask task) async {
    return await getcollectionTasks().doc().set(task);
  }
}
