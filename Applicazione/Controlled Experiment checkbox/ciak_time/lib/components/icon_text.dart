import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key key,
    @required this.size,
    @required this.label,
    @required this.assetName,
  }) : super(key: key);

  final Size size;
  final String label;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: size.width * 0.03,
            ),
            SvgPicture.asset(
              assetName,
              height: size.height * 0.03,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              label,
              style: TextStyle(
                  fontSize: size.height * 0.03, fontFamily: 'Quicksand-Medium'),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.009,
        ),
      ],
    );
  }
}
