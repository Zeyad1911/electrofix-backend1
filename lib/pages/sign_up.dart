import 'package:app/components/user_name_field.dart';
import 'package:app/functions/validate_name.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();

  final hasUppercase = RegExp(r'[A-Z]');
  final hasLowercase = RegExp(r'[a-z]');
  final hasDigit = RegExp(r'\d');
  final hasSpecialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SignupField(
                    hintText: 'User name',
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username cannot be empty.';
                      } else if (value.length < 4) {
                        return 'Username must be at least 4 characters long.';
                      } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                        return 'Username can only contain letters.';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => value),
                SignupField(
                    hintText: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null) {
                        return 'Email address cannot be empty.';
                      } else if (!RegExp(r'^[^\s@]+@[^\s@]+\.com$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) => value),
                SignupField(
                    hintText: 'Password',
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password cannot be empty.';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long.';
                      } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Password must contain at least one uppercase letter.';
                      } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Password must contain at least one lowercase letter.';
                      } else if (!RegExp(r'\d').hasMatch(value)) {
                        return 'Password must contain at least one digit.';
                      } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                          .hasMatch(value)) {
                        return 'Password must contain at least one special character.';
                      }
                      return null;
                    },
                    onSaved: (value) => value),
                SignupField(
                    hintText: 'Confirm password',
                    controller: confPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm password cannot be empty.';
                      } else if (value != confPasswordController.text) {
                        return 'Passwords do not match.';
                      }
                      return null;
                    },
                    onSaved: (value) => value),
                TextButton(
                    onPressed: () {
                      final form = formKey.currentState!;

                      if (form.validate()) {}
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
