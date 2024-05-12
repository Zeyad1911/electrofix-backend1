import 'package:app/utils/has_special.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            prefixIcon: const Icon(Icons.password_rounded),
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                widget.controller.clear();
              },
            ),
            hintText: "Password"),
        controller: widget.controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password required";
          }
          if (value.length < 6) {
            return "Password too short";
          }
          if (!hasSpecialChars(value)) {
            return "include special charcters";
          }
        },
      ),
    );
  }
}
