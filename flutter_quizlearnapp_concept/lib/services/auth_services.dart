part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Reference ref;
  static UploadTask uploadTask;
  static final firestore = FirebaseFirestore.instance;
  final CollectionReference users = firestore.collection('users');

  static Future<String> signUp(String email, String password, String name,
      String usia, String profesi) async {
    await Firebase.initializeApp();
    String msg = "";
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Users users =
          result.user.convertToUser(name: name, usia: usia, profesi: profesi);
      //auth.signOut();
      await UserServices.updateUser(users);
      msg = "success";
    } catch (e) {
      msg = e.toString();
    }

    return msg;
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();
    String msg = "";
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => msg = "success",
          );
    } catch (e) {
      switch (e.code) {
        case "invalid-email":
          msg = "Email invalid";
          return msg;
        case "wrong-password":
          msg = "Password Anda Salah";
          return msg;
        case "user-not-found":
          msg = "User tidak ditemukan";
          return msg;
        case "user-disabled":
          msg = "User telah didisable";
          return msg;
        case "operation-not-allowed":
          msg = "Terlalu banyak permintaan, mohon mencoba lagi";
          return msg;
        default:
          msg = "Masalah tidak diketaui";
      }
    }
    return msg;
  }

  static Future<bool> signout() async {
    await FirebaseAuth.instance.signOut();
    bool result = false;
    await auth.signOut().whenComplete(
          () => result = true,
        );
    return result;
  }

  static Future<User> getCurrentUser() async {
    User user = auth.currentUser;
    return user;
  }
}
