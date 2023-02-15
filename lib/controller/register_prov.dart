import 'package:chatapp/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterProv extends ChangeNotifier {
 GlobalKey<FormState> globalformkey = GlobalKey<FormState>();
  //-------------------------------*Name Validation
  final TextEditingController name = TextEditingController();

  usernameValidation(String? value) {
    if (value!.isEmpty) {
      notifyListeners();
      return 'This is required';
    } else if (value.length < 3) {
      notifyListeners();
      return 'Should contain minimum of 4 letters';
    }
    notifyListeners();
    return null;
  }

//-------------------------------*Email Validation
  final TextEditingController email = TextEditingController();

  emailValidation(String? value) {
    if (value!.isEmpty) {
      notifyListeners();
      return 'This is required';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Please enter a valid email address";
    } else {
      notifyListeners();
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
    notifyListeners();
    return null;
  }

//-----------------------------------------*SignUp
  Future<User?> signUp(
    BuildContext context,
  ) async {
    if (globalformkey.currentState!.validate()) {
      globalformkey.currentState!.save();
      notifyListeners();
      print(name.text);
      print(email.text);
      print(password.text);
      createAccount(name.text, email.text, password.text).then((value) {
        if (User != null) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const RegisterScreen()));
        } else {
          log('faiiled');
        }
      });
    }
  }

  //------------------------------
  Future<User?> createAccount(
      String name, String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      notifyListeners();
      if (user != null) {
        log('Account created successfully');
        notifyListeners();
        return user;
      } else {
        log('Account creation failed');
        notifyListeners();
        return user;
      }
    } catch (e) {
      log('$e');
      notifyListeners();
      return null;
    }
  }

  Future<User?> signIn(String name, String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      User user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      notifyListeners();
      if (user != null) {
        log('Login successfully');
        notifyListeners();
        return user;
      } else {
        log('Login failed');
        notifyListeners();
        return user;
      }
    } catch (e) {
      log('$e');
      notifyListeners();
      return null;
    }
  }

  Future<User?> logOut(String name, String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signOut();
    } catch (e) {
      log('error');
      return null;
    }
    return null;
  }
}
