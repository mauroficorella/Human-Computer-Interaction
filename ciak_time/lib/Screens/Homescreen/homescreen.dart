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
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
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
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CardList(
                    size: size, title: "Upcoming movies", icon: Icons.history),
                CardList(
                    size: size, title: "Popular movies", icon: Icons.movie),
                CardList(
                    size: size,
                    title: "Popular people",
                    icon: Icons.movie_creation),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
