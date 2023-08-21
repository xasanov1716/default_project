import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}


abstract class AuthEvent {}

class AuthCheck extends AuthEvent {}

class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  AuthSignIn(this.email, this.password);
}

class AuthSignUp extends AuthEvent {
  final String email;
  final String password;

  AuthSignUp(this.email, this.password);
}