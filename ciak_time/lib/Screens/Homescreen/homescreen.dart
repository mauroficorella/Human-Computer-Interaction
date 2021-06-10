import 'package:ciak_time/Screens/Login/components/or_divider.dart';
import 'package:ciak_time/components/icon_text.dart';
import 'package:ciak_time/components/popular_movie_list.dart';
import 'package:ciak_time/components/popular_people_list.dart';
import 'package:ciak_time/components/search_movie_results_list.dart';
import 'package:ciak_time/components/upcoming_movie_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'CiakTime',
          style: TextStyle(
            fontSize: size.height * 0.05,
            fontFamily: 'Pattaya',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            IconText(
                size: size,
                assetName: "assets/icons/history.svg",
                label: "Upcoming Movies"),
            UpcomingMovieList(),
            IconText(
                size: size,
                assetName: "assets/icons/movie2.svg",
                label: "Popular Movies"),
            PopularMovieList(
              fromWhere: "Home",
            ),
            IconText(
                size: size,
                assetName: "assets/icons/actor.svg",
                label: "Popular People"),
            PopularPeopleList(
              fromWhere: "Home",
            ),
          ],
        ),
      ),
    );
  }
}
