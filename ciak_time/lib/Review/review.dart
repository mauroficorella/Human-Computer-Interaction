import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class InsertReview extends StatefulWidget {
  const InsertReview({Key key}) : super(key: key);

  @override
  _InsertReviewState createState() => _InsertReviewState();
}

class _InsertReviewState extends State<InsertReview> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Rate the movie',
          style: TextStyle(
            fontSize: size.height * 0.030,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(child: RatingWidget()),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.8,
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write a review',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: "SAVE",
              radius: 5,
              press: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return new AlertDialog(
                      content: StatefulBuilder(
                        builder: (context, setState) {
                          return Container(
                            height: size.height * 0.11,
                            child: Column(
                              children: [
                                Text(
                                  "Do you really want to publish this review?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.02,
                                    fontFamily: 'Quicksand',
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.028,
                                ),
                                Container(
                                  width: size.width * 0.7,
                                  height: size.height * 0.03,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton.icon(
                                        icon: Icon(
                                          Icons.dangerous_outlined,
                                          color: Colors.red,
                                        ),
                                        style: TextButton.styleFrom(
                                          minimumSize: Size(size.width * 0.1,
                                              size.height * 0.005),
                                          padding: EdgeInsets.all(0.0),
                                        ),
                                        onPressed: () {},
                                        label: Text(
                                          "NO",
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: size.height * 0.02,
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      TextButton.icon(
                                        icon: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                        style: TextButton.styleFrom(
                                          minimumSize: Size(size.width * 0.1,
                                              size.height * 0.005),
                                          padding: EdgeInsets.all(0.0),
                                        ),
                                        onPressed: () {},
                                        label: Text(
                                          "YES",
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: size.height * 0.02,
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
