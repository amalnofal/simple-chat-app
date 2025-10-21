import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/or_social.dart';
import 'package:chat_app/widgets/scholar_chat_logo.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const id = "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '',
      lastName = '',
      email = '',
      password = '',
      confirmPass = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          showSnackBar(context, "Account created successfully 🎉");

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                email: state.user.email,
                senderName: state.user.name,
              ),
            ),
          );
        } else if (state is AuthFailure) {
          showSnackBar(context, state.message, isError: true);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 40),
                    const ScholarChat(imageSize: 90, textSize: 26),
                    const Text(
                      "Let's Get Started!",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "First Name",
                            onChange: (v) => firstName = v,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomTextField(
                            hintText: "Last Name",
                            onChange: (v) => lastName = v,
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      onChange: (v) => email = v,
                    ),
                    CustomTextField(
                      hintText: "Password",
                      isPassword: true,
                      onChange: (v) => password = v,
                    ),
                    CustomTextField(
                      hintText: "Confirm Password",
                      isPassword: true,
                      onChange: (v) => confirmPass = v,
                    ),
                    CustomButton(
                      text: "Sign Up",
                      onTap: () {
                        if (!_formKey.currentState!.validate()) return;

                        if (password != confirmPass) {
                          showSnackBar(
                            context,
                            "Passwords do not match",
                            isError: true,
                          );
                          return;
                        }

                        context.read<AuthCubit>().register(
                          firstName: firstName,
                          lastName: lastName,
                          email: email,
                          password: password,
                        );
                      },
                    ),
                    const OrSocial(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginPage.id,
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffc7EDE6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
