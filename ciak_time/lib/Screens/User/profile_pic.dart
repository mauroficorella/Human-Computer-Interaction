import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/vittoria.png'),
            radius: size.height * 0.1,
          ),
          Positioned(
            right: -10,
            bottom: 0,
            child: SizedBox(
              height: size.height * 0.07,
              width: size.height * 0.07,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: kPrimaryColor,
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/camera-white.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
