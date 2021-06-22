import 'package:ciak_time/Screens/Login/login_screen.dart';
import 'package:ciak_time/Screens/navbar.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CiakTime',
      //darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
    );
  }

  /* Widget getHome() {
    setState(() {
      if (isUserLogged == false) {
        home = LoginScreen();
      } else {
        home = HomePage();
      }
    });
    return home;
  }*/
}
