import 'package:ciak_time/components/card_list.dart';
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
