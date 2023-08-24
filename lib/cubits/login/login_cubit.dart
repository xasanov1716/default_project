import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitial());

  void checkAuthentication() async {
    emit(AuthLoading());
    if (auth.currentUser != null) {
      emit(AuthAuthenticated(auth.currentUser!));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      await auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthAuthenticated(auth.currentUser!));
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  void signUp(String email, String password) async {
    try {
      emit(AuthLoading());
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(AuthAuthenticated(auth.currentUser!));
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  void signOut() async {
    await auth.signOut();
    emit(AuthUnauthenticated());
  }
}
