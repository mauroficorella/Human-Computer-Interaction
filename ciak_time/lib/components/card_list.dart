import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({
    Key key,
    @required this.size,
    this.title,
    this.icon,
    this.number, this.height,
  }) : super(key: key);

  final Size size;
  final String title;
  final IconData icon;
  final int number;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: size.height * 0.03,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: size.height * 0.03, fontFamily: 'Quicksand-Medium'),
            ),
          ],
        ),
        Container(
          height: height,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: number,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                color: Colors.amber,
                child: Center(
                  child: Text('Dummy Card Text'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
