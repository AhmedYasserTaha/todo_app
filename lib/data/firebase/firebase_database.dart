import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/data/model/app_task.dart';
import 'package:todo_app/data/model/app_users.dart';

class FirebaseDatabase {
  static CollectionReference<AppUsers> getCollection() {
    return FirebaseFirestore.instance
        .collection("users")
        .withConverter<AppUsers>(
          fromFirestore: (snapshot, options) {
            var data = snapshot.data();
            if (data == null) throw Exception("Snapshot data is null");
            return AppUsers.fromJason(data);
          },
          toFirestore: (value, options) => value.toJason(),
        );
  }

  static Future<void> createUser(AppUsers user) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) throw Exception("User not logged in.");
    var token = currentUser.uid;
    return await getCollection().doc(token).set(user);
  }

  static Future<AppUsers?> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) throw Exception("User not logged in.");

      var token = currentUser.uid;
      var snapShot = await getCollection().doc(token).get();

      if (!snapShot.exists) {
        // إذا كانت الوثيقة غير موجودة
        print("No user data found for the current user.");
        return null;
      }

      var userData = snapShot.data();
      if (userData == null) {
        // إذا كانت البيانات فارغة
        throw Exception("User data is null. Failed to fetch user.");
      }

      return userData;
    } catch (e) {
      // تسجيل الخطأ لسهولة التتبع
      print("Error in getUser: ${e.toString()}");
      rethrow; // إعادة رمي الخطأ لمزيد من التعامل معه في مكان آخر
    }
  }

  static CollectionReference<AppTask> getCollectionTasks() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) throw Exception("User not logged in.");
    var token = currentUser.uid;

    return FirebaseFirestore.instance
        .collection("users")
        .doc(token)
        .collection("task")
        .withConverter(
          fromFirestore: (snapshot, options) {
            var data = snapshot.data();
            if (data == null) throw Exception("Snapshot data is null");
            return AppTask.fromJason(data);
          },
          toFirestore: (appTask, options) => appTask.toJason(),
        );
  }

  static Future<void> addTask(AppTask task) async {
    var collection = getCollectionTasks().doc();

    AppTask newTask = AppTask(
      title: task.title,
      description: task.description,
      dateTime: task.dateTime,
      color: task.color,
      id: collection.id,
    );
    return await collection.set(newTask);
  }

  static Future<List<AppTask>> getAllTasks() async {
    var tasks = await getCollectionTasks().get();
    return tasks.docs.map((task) => task.data()).toList();
  }

  static Future<void> deleteTask(String id) async {
    await getCollectionTasks().doc(id).delete();
  }

  static Future<void> editTask(String id, Map<String, dynamic> data) async {
    await getCollectionTasks().doc(id).update(data);
  }
}
