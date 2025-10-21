import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;

  AuthCubit(this._repo) : super(AuthInitial());

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading()); // بيحمل

      final user = await _repo.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      emit(AuthAuthenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_mapFirebaseError(e)));
    } catch (_) {
      emit(AuthFailure("Something went wrong. Please try again."));
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoading()); // بيحمل

      final user = await _repo.login(email: email, password: password);
      emit(AuthAuthenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_mapFirebaseError(e)));
    } catch (_) {
      emit(AuthFailure("Something went wrong. Please try again."));
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthLoading());
      await _repo.logout();
      emit(AuthUnauthenticated());
    } catch (_) {
      emit(AuthFailure("Something went wrong. Please try again."));
    }
  }

  String _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-credential':
        return 'Invalid email or password. Please try again.';
      default:
        return 'Authentication error. Please try again.';
    }
  }
}
