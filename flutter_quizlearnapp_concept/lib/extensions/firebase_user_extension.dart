part of 'extensions.dart';

//FirebaseUser  ==> User
extension FirebaseUserExtension on User {
  Users convertToUser({String name, String usia, String profesi}) =>
      Users(uid, email,  name: name, usia: usia,profesi: profesi);
//Users convertToUser({String name = "No Name"}) => Users(this.uid, this.email, name: name);
}
