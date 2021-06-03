import 'package:ciak_time/components/icon_text.dart';
import 'package:ciak_time/components/popular_movie_list.dart';
import 'package:ciak_time/components/popular_people_list.dart';
import 'package:flutter/material.dart';

class CardsWidget extends StatelessWidget {
  const CardsWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.0785,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconText(
                      size: size,
                      assetName: "assets/icons/movie2.svg",
                      label: "Popular movies searches"),
                  PopularMovieList(),
                  IconText(
                      size: size,
                      assetName: "assets/icons/actor.svg",
                      label: "Popular people searches",),
                  PopularPeopleList(),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}