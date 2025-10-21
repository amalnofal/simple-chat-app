import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;
  final String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.uid,
  });

  // Factory constructor لتحويل Firebase User إلى UserModel
  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      uid: user.uid,
    );
  }
}
