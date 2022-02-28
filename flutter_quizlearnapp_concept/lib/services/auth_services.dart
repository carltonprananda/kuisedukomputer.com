part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Reference ref;
  static UploadTask uploadTask;
  static final firestore = FirebaseFirestore.instance;
  final CollectionReference users = firestore.collection('user');

  static Future<String> signUp(String email, String password, String name,
      String usia, String profesi) async {
    await Firebase.initializeApp();
    String msg = "Berhasil Masuk";
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Users users =
          result.user.convertToUser(name: name, usia: usia, profesi: profesi);
      auth.signOut();
      await UserServices.updateUser(users);
      msg = "Berhasil Masuk";
    } catch (e) {
      msg = e.toString();
    }

    return msg;
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();
    String msg = "Berhasil Login";
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => msg = "Berhasil Login",
          );
    } catch (e) {
      msg = e.toString();
    }
    return msg;
  }

  static Future<bool> signout() async {
    bool result = false;
    await auth.signOut().whenComplete(
          () => result = true,
        );
    return result;
  }
}
