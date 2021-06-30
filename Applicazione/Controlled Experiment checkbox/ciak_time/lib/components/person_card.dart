import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key key,
    @required this.imageUrl,
    @required this.personName,
  }) : super(key: key);

  final String imageUrl;
  final String personName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: CircleAvatar(
              radius: size.width * 0.18,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                imageUrl,
              ),
            ),
          ),
        ),
        Text(
          personName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.016,
            fontFamily: 'Quicksand',
          ),
        ),
      ],
    );
  }
}
