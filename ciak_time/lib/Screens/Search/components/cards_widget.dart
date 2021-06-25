import 'package:ciak_time/components/icon_text.dart';
import 'package:ciak_time/components/popular_movie_list.dart';
import 'package:ciak_time/components/popular_people_list.dart';
import 'package:flutter/material.dart';

class CardsWidget extends StatelessWidget {
  const CardsWidget({
    Key key,
    
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.025,
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
                  PopularMovieList(fromWhere: "Search",),
                  IconText(
                      size: size,
                      assetName: "assets/icons/actor.svg",
                      label: "Popular people searches",),
                  PopularPeopleList(fromWhere: "Search",),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}