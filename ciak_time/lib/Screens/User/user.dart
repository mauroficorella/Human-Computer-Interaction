import 'package:ciak_time/components/card_list.dart';
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
          height: size.height * 0.07,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.settings),
            SizedBox(
              width: size.width * 0.05,
            )
          ],
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
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CardList(
                  size: size,
                  title: "Watchlist",
                  icon: Icons.list,
                  number: 3,
                  height: size.height * 0.15,
                ),
                CardList(
                  size: size,
                  title: "Already watched",
                  icon: Icons.done,
                  number: 3,
                  height: size.height * 0.15,
                ),
                CardList(
                  size: size,
                  title: "Favourite",
                  icon: Icons.favorite,
                  number: 3,
                  height: size.height * 0.15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
