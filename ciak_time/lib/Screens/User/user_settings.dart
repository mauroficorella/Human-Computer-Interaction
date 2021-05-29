import 'package:ciak_time/Screens/User/profile_pic.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.05,
                height: size.height * 0.12,
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UserSettings();
                      },
                    ),
                  );
                },
                iconSize: size.width * 0.07,
                splashRadius: size.width * 0.05,
              ),
            ],
          ),
          Center(child: ProfilePic())
        ],
      ),
    );
    /*return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/vittoria.png'),
                radius: 80,
              ),
              Positioned(
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: FlatButton(
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: SvgPicture.asset("assets/icons/photo-camera.svg"),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.28,
              ),
              Icon(Icons.photo),
              Text(
                "New Image",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.03,
                  fontFamily: 'Quicksand-Medium',
                ),
              ),
            ],
          ),
        ],
      ),
    );*/
  }
}
