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
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size.width * 0.15,
      unratedColor: Colors.grey[400],
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
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
    return RatingBarIndicator(
      rating: rate / 2,
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
