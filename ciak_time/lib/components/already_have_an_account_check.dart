import 'dart:developer';

import 'package:ciak_time/Screens/Login/login_screen.dart';
import 'package:ciak_time/Screens/Signup/signup_screen.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;

  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account? " : "Already have an Account? ",
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'Quicksand',
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size(size.width * 0.1, size.height * 0.005),
            padding: EdgeInsets.all(0.0),
          ),
          onPressed: () {
            if (login) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            }
          },
          child: Text(login ? "Sign Up" : "Sign In",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand',
              )),
        )
      ],
    );
  }
}
