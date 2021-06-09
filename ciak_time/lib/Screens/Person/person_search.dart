import 'package:ciak_time/components/person_overview.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';

import 'package:flutter/material.dart';

class PersonSearch extends StatefulWidget {
  @override
  _PersonSearchState createState() => _PersonSearchState();
}

class _PersonSearchState extends State<PersonSearch> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "Search",
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.23,
        title: Text(
          personSelectedFromSearch.name,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            PersonOverview(
              fromWhere: "Search",
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Filmography",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.03,
                        fontFamily: 'Quicksand-Medium',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: MovieCard(
                            size: size,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width * 0.3,
          height: size.width * 0.3,
          child: Card(
            color: Colors.amber,
            child: Center(
              child: Text('Dummy Card Text'),
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Titolo film",
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontFamily: 'Quicksand-Regular',
              ),
            ),
            RatingUnclickable(
                unratedColor: Colors.grey,
                rate: 2.0) //TODO passare parametri stelle
          ],
        ),
      ],
    );
  }
}
