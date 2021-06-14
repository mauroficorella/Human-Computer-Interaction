import 'package:ciak_time/components/list_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardList extends StatelessWidget {
  const CardList({
    Key key,
    @required this.size,
    this.title,
    this.assetName,
    this.number,
    this.height,
    this.width,
    this.list,
  }) : super(key: key);

  final Size size;
  final String title;
  final String assetName;
  final int number;
  final double height;
  final double width;

  final List<Movie> list;

  Widget getViewAllButton(context) {
    if ((list == watchList && watchList.isNotEmpty) ||
        (list == alreadyWatchedList && alreadyWatchedList.isNotEmpty) ||
        (list == favouriteList && favouriteList.isNotEmpty)) {
      return ViewAllButton(list: list, size: size);
    } else {
      return Container();
    }
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
                    movieSelectedFromUser = list[index];
                    Navigator.pushNamed(context, '/movie');
                    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
                  },
                ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      fontSize: size.height * 0.03,
                      fontFamily: 'Quicksand-Medium'),
                ),
              ],
            ),
            getViewAllButton(context),
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

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    Key key,
    @required this.list,
    @required this.size,
  }) : super(key: key);

  final List<Movie> list;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
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
      icon: Text(
        "View all",
        style: TextStyle(
            color: kPrimaryColor,
            fontSize: size.height * 0.02,
            fontFamily: 'Quicksand-Medium'),
      ),
    );
  }
}
