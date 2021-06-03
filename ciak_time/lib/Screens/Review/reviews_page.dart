import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Reviews',
          style: TextStyle(
            fontSize: size.height * 0.03,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01),
              reviewWidget(size: size),
              reviewWidget(size: size),
              reviewWidget(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class reviewWidget extends StatelessWidget {
  const reviewWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width * 0.98,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
                child: Column(
                  children: [
                    circleAvatarText(size: size),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Questa è una recensione su quanto Marrel sia Cattivissimo Me",
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontFamily: 'Quicksand-Regular',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: size.height * 0.04,
                    width: (size.width * 0.98) / 2,
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor, width: 1.5),
                        color: kPrimaryLightColor),
                    child: TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                      ),
                      icon: Icon(Icons.favorite, color: kPrimaryColor),
                      label: Text(
                        "Like",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: size.height * 0.018,
                            fontFamily: 'Quicksand-Medium'),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.04,
                    width: (size.width * 0.98) / 2,
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor, width: 1.5),
                        color: kPrimaryLightColor),
                    child: TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                      ),
                      icon: Icon(Icons.comment, color: kPrimaryColor),
                      label: Text(
                        "Comment",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: size.height * 0.018,
                            fontFamily: 'Quicksand-Medium'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }
}

class circleAvatarText extends StatelessWidget {
  const circleAvatarText({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://www.casaprogettata.it/wp-content/uploads/2016/01/Users-User-Male-4-icon.png'),
          radius: size.width * 0.03,
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Text(
          "User",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.02,
            fontFamily: 'Quicksand-Medium',
          ),
        ),
      ],
    );
  }
}
