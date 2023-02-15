import 'package:chatapp/constants/const.dart';
import 'package:chatapp/controller/register_prov.dart';
import 'package:chatapp/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
 
class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<RegisterProv>(
        builder: (BuildContext context, reg, Widget? child) {
          return Form(
            key: reg.globalformkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome', style: welcomestyle),
                  kSize5,
                  const Text(
                    'Create Account to Continue!',
                    style: welcomestyle2,
                  ),
                  kSize30,
                  CustomTextFormField(
                    hintText: 'Name',
                    labelText: 'Name',
                    obscureText: false,
                    icon: const Icon(Icons.account_box),
                    controller: reg.name,
                    validator: (value) => reg.usernameValidation(value),
                  ),
                  kSize16,
                  CustomTextFormField(
                    hintText: 'Email',
                    labelText: 'Email',
                    obscureText: false,
                    icon: const Icon(Icons.account_box),
                    controller: reg.email,
                    validator: (value) => reg.emailValidation(value),
                  ),
                  kSize16,
                  CustomTextFormField(
                    hintText: 'Enter your Password',
                    labelText: 'Password',
                    obscureText: true,
                    icon: const Icon(Icons.lock),
                    controller: reg.password,
                    validator: (value) => reg.passwordValidationn(value),
                  ),
                  kSize20,
                  ElevatedButton(
                      onPressed: () {
                        reg.signUp(context);
                      },
                      child: const Text('Create Account')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Login')),
                ]),
          );
        },
      ),
    ));
  }
}
