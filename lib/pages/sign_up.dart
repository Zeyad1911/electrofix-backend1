import 'package:app/components/user_name_field.dart';
import 'package:app/functions/validate_name.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
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
            child: Column(
              children: [
                UsernameField(
                    hintText: 'User name',
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username cannot be empty.';
                      } else if (value.length < 4) {
                        return 'Username must be at least 4 characters long.';
                      } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                        return 'Username can only contain letters, numbers, and underscores.';
                      }
                      print('good');
                      return null;
                    },
                    onSaved: (value) => value),
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        final form = _formKey
                            .currentState!; // Now safe to access after check
                        if (form.validate()) {
                          print('valid');
                        }
                      } else {
                        // Handle the case where the form is not yet initialized (optional)
                      }
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
