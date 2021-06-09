import 'package:ciak_time/Screens/Homescreen/homescreen.dart';
import 'package:ciak_time/Screens/Search/search.dart';
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
        title: Text("User"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            child: Row(
              children: [
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
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
                      number: watchList.length,
                      height: size.height * 0.17,
                      width: size.width * 0.035,
                      list: watchList,
                    ),
                    CardList(
                      size: size,
                      title: "Already watched",
                      assetName: "assets/icons/check.svg",
                      number: alreadyWatchedList.length,
                      height: size.height * 0.17,
                      width: size.width * 0.035,
                      list: alreadyWatchedList,
                    ),
                    CardList(
                      size: size,
                      title: "Favourite",
                      assetName: "assets/icons/heart-red.svg",
                      number: favouriteList.length,
                      height: size.height * 0.17,
                      width: size.width * 0.035,
                      list: favouriteList,
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

