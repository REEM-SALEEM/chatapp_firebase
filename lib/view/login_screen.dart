import 'package:chatapp/constants/const.dart';
import 'package:chatapp/controller/signin_prov.dart';
import 'package:chatapp/view/register_screen.dart';
import 'package:chatapp/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<SignInProv>(
        builder: (BuildContext context, sign, Widget? child) {
          return Form(
            key: sign.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome', style: welcomestyle),
                kSize5,
                const Text(
                  'Sign in to Continue!',
                  style: welcomestyle2,
                ),
                kSize30,
                CustomTextFormField(
                  hintText: 'Email',
                  labelText: 'Email',
                  obscureText: false,
                  icon: const Icon(Icons.account_box),
                  controller: sign.email,
                  validator: (value) => sign.emailValidation(value),
                ),
                kSize16,
                CustomTextFormField(
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                  obscureText: true,
                  icon: const Icon(Icons.lock),
                  controller: sign.password,
                  validator: (value) => sign.passwordValidationn(value),
                ),
                kSize20,
                ElevatedButton(onPressed: () {}, child: const Text('Login')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                    },
                    child: const Text('Create Account')),
              ],
            ),
          );
        },
      ),
    ));
  }
}
