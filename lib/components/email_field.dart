import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: TextFormField(
          controller: widget.controller,
          onChanged: (value) => {print(value)},
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            hintStyle: const TextStyle(fontWeight: FontWeight.bold),
            prefixIcon: const Icon(Icons.email_rounded),
            suffixIcon: IconButton(
              onPressed: () {
                widget.controller.clear();
              },
              icon: const Icon(Icons.close),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          autofillHints: [AutofillHints.email],
          validator: (email) =>
              !EmailValidator.validate(email!) ? "enter valid email" : null,
        ),
      ),
    );
  }
}
