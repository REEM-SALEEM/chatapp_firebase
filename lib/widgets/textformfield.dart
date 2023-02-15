import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool obscureText;
  final Icon icon;
  final FormFieldValidator<String> validator;

  final TextEditingController controller;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    required this.icon,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: icon,
        prefixIconColor: const Color.fromARGB(255, 189, 187, 187),
        border: const OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: hintText,
        labelText: labelText,
      ),
      validator: validator,
    );
  }
}
