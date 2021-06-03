import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key key,
    @required this.imageUrl,
    @required this.personName,
  }) : super(key: key);

  final String imageUrl;
  final String personName;

  /* @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          //color: Colors.amber,
          child: Container(
            color: Colors.greenAccent[400],
            child: Column(
              children: [
                Container(
                  height: 150.0,
                  //width: 50.0,
                  child: Image.network(
                    imageUrl,
                    //fit: BoxFit.cover,
                  ),
                ),
                Text(movieTitle),
                Text(voteAverage),
              ],
            ),
          ),
        ),
      ],
    );
  }
}*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          child: Stack(
            children: [
              Container(
                height: size.width * 0.45,
                width: size.width * 0.3,
                //width: 50.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 2.0,
                child: Container(
                  width: size.width * 0.28,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.9),
                        spreadRadius: 5,
                        blurRadius: 18,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 4.0),
                        child: Text(
                          personName,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.03,
                            fontFamily: 'Quicksand-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Text(voteAverage),
            ],
          ),
        ),
      ],
    );
  }
}
