import 'package:ciak_time/components/card_list.dart';
import 'package:ciak_time/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            height: size.height * 0.05,
            width: size.width * 1,
            //margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: navBarColor,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        //color: Colors.black,
                        fontSize: 20,
                      ),
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: <Widget>[
                      VerticalDivider(color: kPrimaryColor),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/setting-lines.svg",
                          height: size.height * 0.15,
                        ),
                        //icon: Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      body: SafeArea(
        child: Column(
          children: [
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
