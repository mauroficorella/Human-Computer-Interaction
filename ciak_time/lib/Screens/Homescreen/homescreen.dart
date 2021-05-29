import 'package:ciak_time/components/card_list.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/movie.svg",
                  height: size.height * 0.055,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Text(
                  "CiakTime",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.05,
                      fontFamily: 'Pattaya',
                      color: kPrimaryColor),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CardList(
                      size: size,
                      title: "Upcoming movies",
                      assetName: "assets/icons/history.svg",
                      number: 16,
                      height: size.height * 0.23,
                      width: size.width * 0.01,
                    ),
                    CardList(
                      size: size,
                      title: "Popular movies",
                      assetName: "assets/icons/movie2.svg",
                      number: 16,
                      height: size.height * 0.23,
                      width: size.width * 0.01,
                    ),
                    CardList(
                      size: size,
                      title: "Popular people",
                      assetName: "assets/icons/actor.svg",
                      number: 16,
                      height: size.height * 0.23,
                      width: size.width * 0.01,
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
