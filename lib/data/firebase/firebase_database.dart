import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
}
