import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeBtn extends StatelessWidget {
  const LikeBtn({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 30,
      circleColor: CircleColor(start: Colors.red[50], end: Colors.red[100]),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Colors.red[200],
        dotSecondaryColor: Colors.redAccent[400],
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? Colors.redAccent[700] : Colors.white,
          size: size.width * 0.08,
        );
      },
    );
  }
}