import 'package:ciak_time/Screens/Login/login_screen.dart';
import 'package:ciak_time/Screens/User/profile_pic.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/components/social_icon.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: size.height * 0.030,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(child: ProfilePic()),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Vittoria",
                        style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: 'Quicksand-Regular'),
                      ),
                      SizedBox(width: size.width * 0.02),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/edit.svg"),
                        iconSize: size.height * 0.035,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: 'Quicksand-Regular'),
                      ),
                      SizedBox(width: size.width * 0.02),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/edit.svg"),
                        iconSize: size.height * 0.035,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.13,
                  ),
                  Center(
                    child: Text(
                      "CONNECT AN ACCOUNT:",
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontFamily: 'Quicksand-Regular',
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(
                        iconSrc: "assets/icons/google.svg",
                        press: () {},
                      ),
                      SocialIcon(
                        iconSrc: "assets/icons/facebook.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),
                  RoundedButton(
                    text: "LOGOUT",
                    radius: 29,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
