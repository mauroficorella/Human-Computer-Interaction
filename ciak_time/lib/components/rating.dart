import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RatingBar.builder(
      initialRating: 0,
      minRating: 0.5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size.width * 0.1,
      unratedColor: Colors.grey[400],
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        //print(rating);
      },
    );
  }
}

class RatingUnclickable extends StatelessWidget {
  const RatingUnclickable({
    Key key,
    @required this.unratedColor,
    @required this.rate,
  }) : super(key: key);

  final Color unratedColor;
  final double rate;

  @override
  Widget build(BuildContext context) {
    double value;
    
    if (rate == null || rate == 0.0) {
      print("ciao");
      
      value = 0.0;
    } else {
      value = rate / 2;
    }

    return RatingBarIndicator(
      rating: value,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 25.0,
      unratedColor: unratedColor,
      direction: Axis.horizontal,
    );
  }
}
