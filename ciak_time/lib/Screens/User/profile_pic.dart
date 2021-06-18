import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        profilePicPath = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
  }

  String profilePicPath = 'assets/images/vittoria.png';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profilePicPath),
            backgroundColor: Colors.white,
            radius: size.height * 0.1,
          ),
          Positioned(
            right: -10,
            bottom: 0,
            child: SizedBox(
              height: size.height * 0.07,
              width: size.height * 0.07,
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.07,
                    width: size.height * 0.07,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: kPrimaryColor,
                      onPressed: () => getImage(),
                      child: SvgPicture.asset("assets/icons/camera-white.svg"),
                    ),
                  ),
                  Flexible(
                      child: _image != null
                          ? Image.file(_image)
                          : Text('no Image')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
