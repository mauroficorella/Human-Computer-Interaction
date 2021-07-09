import 'package:ciak_time/Screens/Person/filmography_list.dart';

import 'package:ciak_time/components/person_overview.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';


import 'package:flutter/material.dart';

List<Movie> list;

class PersonHome extends StatefulWidget {
  

  const PersonHome({
    Key key,
  }) : super(key: key);

  @override
  _PersonHomeState createState() => _PersonHomeState();
}

class _PersonHomeState extends State<PersonHome> {
  @override
  Widget build(BuildContext context) {
    
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
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
          label: Container(
            width: size.width * 0.1,
            child: Text(
              args.fromWhere,
              
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.amber, fontFamily: 'Quicksand-Regular'),
            ),
          ),
        ),
        leadingWidth: size.width * 0.25,
        title: Text(
          personSelectedFromHome.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            PersonOverview(
              fromWhere: "Home",
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
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
                padding: const EdgeInsets.fromLTRB(12.0, 8.0, 0.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Filmography",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.023,
                            fontFamily: 'Quicksand-Medium',
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/filmography'); 
                          },
                          label:
                              Icon(Icons.arrow_forward, color: kPrimaryColor),
                          icon: Text(
                            "View all",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: size.height * 0.02,
                                fontFamily: 'Quicksand-Medium'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        FilmographyList(
                          fromWhere: "Home",
                        ),
                      ],
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
