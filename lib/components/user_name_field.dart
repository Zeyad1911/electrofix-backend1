import 'package:app/functions/validate_name.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSaved;
  final String hintText;
  final String? Function(String?) validator;
  const UsernameField(
      {super.key,
      required this.controller,
      required this.onSaved,
      required this.hintText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          child: TextFormField(
            controller: controller,
            onSaved: onSaved,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(Icons.close),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
            validator: validator,
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
