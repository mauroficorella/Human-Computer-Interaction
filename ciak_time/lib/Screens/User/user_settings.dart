import 'package:ciak_time/Screens/User/profile_pic.dart';
import 'package:ciak_time/main.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.05,
                              fontFamily: 'Quicksand-Medium'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_new),
                          onPressed: () {
                            Navigator.pop(
                                context); //to go back to the previous page
                          },
                          iconSize: size.width * 0.07,
                          //splashRadius: size.width * 0.05,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(child: ProfilePic()),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vittoria",
                  style: TextStyle(
                      fontSize: size.height * 0.04,
                      fontFamily: 'Quicksand-Regular'),
                ),
                SizedBox(width: size.width * 0.02),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/edit.svg")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*
return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /*SizedBox(
                  width: size.width * 0.01,
                ),*/
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context); //to go back to the previous page
                  },
                  iconSize: size.width * 0.07,
                  splashRadius: size.width * 0.05,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.04,
                    fontFamily: 'Quicksand-Medium',
                  ),
                ),
              ],
            ),
            Center(child: ProfilePic()),
            SizedBox(),
          ],
        ),
      ),
    );
*/
