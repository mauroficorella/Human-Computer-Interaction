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
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        isFromGallery = true;
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          getCircleAvatar(size, isFromGallery),
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
                      child:
                          image != null ? Image.file(image) : Text('no Image')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

CircleAvatar getCircleAvatar(Size size, bool isFromGallery) {
  if (isFromGallery) {
    profilePicture = CircleAvatar(
      backgroundImage: FileImage(image),
      backgroundColor: Colors.white,
      radius: size.height * 0.1,
    );
    picturePath = image.path;
    print(picturePath);
  } else {
    profilePicture = CircleAvatar(
      backgroundImage: AssetImage(changeProfilePicPath()),
      backgroundColor: Colors.white,
      radius: size.height * 0.1,
    );
    picturePath = changeProfilePicPath();
  }
  return profilePicture;
}
