import 'package:ciak_time/components/rating.dart';
import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://d2dzp1iimffyb3.cloudfront.net/wp-content/uploads/2020/12/Sam-Heughan-The-Rake-226_FINAL_CMYK-RF.jpg'),
                  radius: size.height * 0.1,
                ),
              ],
            ),
            Text(
              "Sam Heughan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.05,
                fontFamily: 'Quicksand-Medium',
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
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
                      "Biography",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.03,
                        fontFamily: 'Quicksand-Medium',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Nasce a Balmaclellan, frazione di New Galloway (Scozia), il 30 aprile 1980. Dal 2013 interpreta il protagonista Jamie Fraser nella serie televisiva Outlander, basata sull'omonima serie di romanzi di Diana Gabaldon.",
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontFamily: 'Quicksand-Regular',
                      ),
                    ),
                  ],
                ),
              ),
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
                        child: MovieCard(size: size,)
                      ),
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
            RatingUnclickable(unratedColor: Colors.grey,) //TODO passare parametri stelle
          ],
        ),
      ],
    );
  }
}
