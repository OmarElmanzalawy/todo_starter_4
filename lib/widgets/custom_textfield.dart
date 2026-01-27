import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.prefix,
    required this.hintText,
    required this.controller,
    this.validator
    });

  final IconData? prefix;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ?? (value) {
        
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          )
        ),
        hintText: hintText,
        prefixIcon: Icon(prefix),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}
