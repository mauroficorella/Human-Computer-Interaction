import 'package:ciak_time/components/list_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
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
    this.list,
  }) : super(key: key);

  final Size size;
  final String title;
  //final IconData icon;
  final String assetName;
  final int number;
  final double height;
  final double width;

  final List<Results> list;

  int setLenght(List list) {
    int len;
    if (list.length <= 3) {
      len = list.length;
    } else {
      len = 3;
    }
    return len;
  }

  Widget getListContent(context) {
    if (list.isNotEmpty) {
      return Row(
        children: [
          SizedBox(
            width: size.width * 0.025,
          ),
          Container(
            height: height,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: setLenght(list),
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                  child: ListCard(
                    movieTitle: list[index].title,
                    imageUrl:
                        'https://image.tmdb.org/t/p/original${list[index].posterPath}',
                  ),
                  onTap: () {
                    movieSelected = list[index];
                    Navigator.pushNamed(context, '/movie');
                    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
                  },
                ),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              if (list == watchList) {
                Navigator.pushNamed(context, '/watchlist');
              }
              if (list == alreadyWatchedList) {
                Navigator.pushNamed(context, '/alreadywatchedlist');
              }
              if (list == favouriteList) {
                Navigator.pushNamed(context, '/favouritelist');
              }
            },
            label: Icon(Icons.arrow_forward, color: kPrimaryColor),
            icon: Container(
              width: size.width * 0.11,
              //width: size.width * 0.15,
              child: Text(
                "View all",
                //textAlign: TextAlign.end,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: size.height * 0.02,
                    fontFamily: 'Quicksand-Medium'),
              ),
            ),
          ),
        ],
      );
    } else {
      return Text(
        "No movie added yet to this list",
        style: TextStyle(
          fontSize: size.height * 0.02,
          fontFamily: 'Quicksand',
          color: Colors.grey,
        ),
      );
    }
  }

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
        getListContent(context),
        SizedBox(
          height: size.height * 0.01,
        ),
      ],
    );
  }
}
