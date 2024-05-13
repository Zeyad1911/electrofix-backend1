import 'package:app/functions/validate_name.dart';
import 'package:flutter/material.dart';

class SignupField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String?) onSaved;
  final String hintText;
  final String? Function(String?) validator;

  const SignupField({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.hintText,
    required this.validator,
  });

  @override
  State<SignupField> createState() => _SignupFieldState();
}

class _SignupFieldState extends State<SignupField> {
  String _username = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          child: TextFormField(
            controller: widget.controller,
            onSaved: widget.onSaved,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontWeight: FontWeight.bold),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _username = "";
                    widget.controller.clear();
                  });
                },
                icon: const Icon(Icons.close),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            validator: widget.validator,
            onChanged: (value) {
              setState(() {
                _username = value ?? "";
              });
            },
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
