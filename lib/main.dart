import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/repositories/auth_repository.dart';
import 'package:chat_app/cubit/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    BlocProvider(
      create: (_) => AuthCubit(AuthRepository()),
      child: const ChatApp(),
    ),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (_) => const LoginPage(),
        RegisterPage.id: (_) => const RegisterPage(),
      },
      initialRoute: RegisterPage.id, // بدايه التطبيق
      // كود ذكي لو فيه يوزر مسجل يدخل علطول
      // initialRoute: AuthRepository().getCurrentUser() != null
      //     ? ChatPage.id
      //     : LoginPage.id,
    );
  }
}
