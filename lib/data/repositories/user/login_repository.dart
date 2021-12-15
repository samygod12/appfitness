import 'package:equatable/equatable.dart';

class LoginUser extends Equatable {
  String uid = "";

  LoginUser (this.uid, );

  @override
  List<Object?> get props => [uid];
}

abstract class LoginRepository {
  Stream<LoginUser?> get onAuthStateChanged;


  Future<LoginUser?> signInAnonymously();

  Future<LoginUser?> signInWithGoogle();

  Future<void> signOut();
}