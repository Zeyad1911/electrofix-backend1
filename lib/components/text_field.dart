import 'package:flutter/material.dart';

class CusTextField extends StatefulWidget {
  const CusTextField({super.key});

  @override
  State<CusTextField> createState() => _CusTextFieldState();
}

class _CusTextFieldState extends State<CusTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: TextFormField(
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: "Password",
            hintStyle: const TextStyle(fontWeight: FontWeight.bold),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
    );
  }
}
