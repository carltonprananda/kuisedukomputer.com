part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  static DocumentReference userDoc;
  static Reference ref;
  static UploadTask uploadTask;
  // static String imageUrl;

  static Future<void> updateUser(Users users) async {
    userCollection.doc(users.uid).set({
      'uid': users.uid,
      'email': users.email,
      'name': users.name,
      'usia': users.usia,
      'profesi': users.profesi
    });
  }

  static Future<bool> editProduct(Users users) async {
    await Firebase.initializeApp();

    await userCollection.doc(users.uid).update(
      {'name': users.name, 'usia': users.usia, 'profesi': users.profesi},
    );

    return true;
  }
}
