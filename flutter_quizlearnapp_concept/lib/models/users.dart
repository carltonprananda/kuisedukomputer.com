part of 'models.dart';

class Users extends Equatable {

  final String uid;
  final String email;
  final String name;
  final String usia;
  final String profesi;

  const Users(
    this.uid,
    this.email,
    {this.name, this.usia, this.profesi}
  );

  @override
  List<Object> get props => [uid, email, name, usia, profesi];

}
