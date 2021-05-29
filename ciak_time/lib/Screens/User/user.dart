import 'package:ciak_time/Screens/User/user_settings.dart';
import 'package:ciak_time/components/card_list.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
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
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/vittoria.png'),
                  radius: size.height * 0.1,
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
            SizedBox(
              height: size.height * 0.03,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CardList(
                      size: size,
                      title: "Watchlist",
                      assetName: "assets/icons/list.svg",
                      number: 3,
                      height: size.height * 0.15,
                      width: size.width * 0.035,
                    ),
                    CardList(
                      size: size,
                      title: "Already watched",
                      assetName: "assets/icons/check.svg",
                      number: 3,
                      height: size.height * 0.15,
                      width: size.width * 0.035,
                    ),
                    CardList(
                      size: size,
                      title: "Favourite",
                      assetName: "assets/icons/heart.svg",
                      number: 3,
                      height: size.height * 0.15,
                      width: size.width * 0.035,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
