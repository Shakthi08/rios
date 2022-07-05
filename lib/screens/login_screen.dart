// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imeetnow/resources/auth_methods.dart';

import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Start or join an iMeet',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Image.asset('assets/images/onboarding.jpg')),
        CustomButton(
          text: 'Sign in',
          onPressed: () async {
            _showToast(context);
            bool res = await _authMethods.signinWithGoogle(context);
            if (res) {
              Navigator.pushNamed(context, '/home');
            }
          },
        ),
      ],
    ));
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Coming soon!'),
        action: SnackBarAction(
            label: 'UGH!', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
