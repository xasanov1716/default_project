import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitial());

  void checkAuthentication() async {
    emit(AuthLoading());
    if (_auth.currentUser != null) {
      emit(AuthAuthenticated(_auth.currentUser!));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthAuthenticated(_auth.currentUser!));
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  void signUp(String email, String password) async {
    try {
      emit(AuthLoading());
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(AuthAuthenticated(_auth.currentUser!));
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  void signOut() async {
    await _auth.signOut();
    emit(AuthUnauthenticated());
  }
}
