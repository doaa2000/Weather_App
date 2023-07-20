import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.text,
    required this.controller,
    required this.onPressed,
  });
  final String text;
  final TextEditingController controller;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onPressed,
      controller: controller,
      decoration: InputDecoration(
        label: Text(text),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
