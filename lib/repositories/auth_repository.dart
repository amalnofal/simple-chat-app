import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user!.updateDisplayName("$firstName $lastName");
    await credential.user!.reload();
    return UserModel.fromFirebase(credential.user!);
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebase(credential.user!);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  UserModel? getCurrentUser() {
    final u = _auth.currentUser;
    if (u == null) return null;
    return UserModel.fromFirebase(u);
  }
}
