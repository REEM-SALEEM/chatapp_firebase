import 'package:flutter/material.dart';

class SignInProv extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //-------------------------------*Email Validation
  final TextEditingController email = TextEditingController();

  emailValidation(String? value) {
    if (value!.isEmpty) {
      return 'This is required';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }

  //-------------------------------*Password Validation
  final TextEditingController password = TextEditingController();

  passwordValidationn(String? value) {
    if (value == null || value.isEmpty) {
      notifyListeners();
      return 'This is required';
    } else if (value.length < 3) {
      notifyListeners();
      return 'Should contain minimum of 4 letters';
    }
    return null;
  }
}
