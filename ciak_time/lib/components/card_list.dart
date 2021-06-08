import 'package:ciak_time/components/list_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardList extends StatelessWidget {
  const CardList({
    Key key,
    @required this.size,
    this.title,
    //this.icon,
    this.assetName,
    this.number,
    this.height,
    this.width,
    this.movieSelected, this.list,
  }) : super(key: key);

  final Size size;
  final String title;
  //final IconData icon;
  final String assetName;
  final int number;
  final double height;
  final double width;
  final Results movieSelected;
  final List<Results> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: width,
            ),
            SvgPicture.asset(
              assetName,
              height: size.height * 0.03,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: size.height * 0.03, fontFamily: 'Quicksand-Medium'),
            ),
          ],
        ),
        Container(
          height: height,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: number,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: ListCard(
                movieTitle: list[index].title,
                imageUrl:
                    'https://image.tmdb.org/t/p/original${list[index].posterPath}',
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
      ],
    );
  }
}
