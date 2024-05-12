import 'package:app/components/email_field.dart';
import 'package:app/components/password_field.dart';
import 'package:app/components/text_field.dart';
import 'package:app/pages/sign_up.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _handleSignUpNav() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignupPage();
    }));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Image.asset(
              "asset/logo.png",
              height: 100,
            ),
            const Text("Welcome again"),
            const SizedBox(
              height: 25,
            ),
            EmailField(
              controller: emailController,
            ),
            SizedBox(
              height: 25,
            ),
            PasswordField(
              controller: passwordController,
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.indigo[300]),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        final form = formKey.currentState!;

                        if (form.validate()) {
                          final email = emailController.text;
                          final password = passwordController.text;

                          print("true");
                        }
                      },
                      child: const SizedBox(
                          width: 100,
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )))),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      onPressed: () {
                        _handleSignUpNav();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.indigo[200]),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
