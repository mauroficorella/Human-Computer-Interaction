import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/vittoria.png'),
              radius: 80,
            ),
          ],
        ),
        Text(
                "Vittoria",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.05,
                    fontFamily: 'Quicksand-Medium',
                  ),
              ),
      ],
    );
  }
}
