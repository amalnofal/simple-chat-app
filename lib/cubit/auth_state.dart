import '../models/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {} // البداية

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  // لما ينجح
  final UserModel user;
  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {} // لما يسجل خروج

class AuthFailure extends AuthState {
  // لو حصل خطأ
  final String message;
  AuthFailure(this.message);
}
