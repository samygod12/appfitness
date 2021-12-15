import 'dart:async';

import 'package:appfitness/data/repositories/user/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  late StreamSubscription _loginSubscription;
  LoginCubit(this._loginRepository) : super(LoginInitialState());
  Future<void> init() async {
    _loginSubscription =
        _loginRepository.onAuthStateChanged.listen(_authStateChanged);
  }

  void _authStateChanged(LoginUser? user) =>
      user == null ? emit(LoginSignedOut()) : emit(LoginSignedIn(user));

  Future<void> signInAnonymously() =>
      _signIn(_loginRepository.signInAnonymously());

  Future<void> signInWithGoogle() =>
      _signIn(_loginRepository.signInWithGoogle());

  Future<void> _signIn(Future<LoginUser?> auxUser) async {
    try {
      emit(LoginSigningIn());
      final user = await auxUser;
      if (user == null) {
        emit(LoginError('Error desconocido'));
      } else {
        emit(LoginSignedIn(user));
      }
    } catch (e) {
      emit(LoginError('Error: ${e.toString()}'));
    }
  }

  Future<void> signOut() async {
    await _loginRepository.signOut();
    emit(LoginSignedOut());
  }

  @override
  Future<void> close() {
    _loginSubscription.cancel();
    return super.close();
  }
}

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginSignedOut extends LoginState {}

class LoginSigningIn extends LoginState {}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
  @override
  List<Object?> get props => [message];
}

class LoginSignedIn extends LoginState {
  final LoginUser user;

  LoginSignedIn(this.user);

  @override
  List<Object?> get props => [user];
}