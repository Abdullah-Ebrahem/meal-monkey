import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/proj_button.dart';
import 'package:flutter_application_1/core/proj_input.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
          ),
          const Text(
            'Reset Password',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff4A4B4D)),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Please enter your email to receive a\n'
            'link to  create a new password via email',
            style: TextStyle(color: Color(0xff7C7D7E), fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 60,
          ),
          ProjInput(
            hintText: 'Email',
            bottomPadding: 34,
          ),
          ProjButton(
            title: 'Send',
            onPress: () {},
          )
        ],
      ),
    );
  }
}
