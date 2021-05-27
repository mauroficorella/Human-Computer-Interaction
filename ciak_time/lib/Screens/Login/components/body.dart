import 'package:ciak_time/Screens/Login/components/background.dart';
import 'package:ciak_time/Screens/Login/components/or_divider.dart';
import 'package:ciak_time/Screens/Signup/signup_screen.dart';
import 'package:ciak_time/components/already_have_an_account_check.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/components/rounded_input_field.dart';
import 'package:ciak_time/components/rounded_password_field.dart';
import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: Container(
        margin: EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "CiakTime",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60.0,
                    fontFamily: 'Pattaya',
                    color: kPrimaryColor),
              ),
              SvgPicture.asset("assets/icons/movie.svg",
                  width: size.width * 0.45),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: kPrimaryColor,
                    onPressed: () {},
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "CiakTime",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 75.0,
                    fontFamily: 'Pattaya',
                    color: kPrimaryColor),
              ),
              SvgPicture.asset(
                "assets/icons/movie.svg",
                height: size.height * 0.25,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    RoundedInputField(
                      hintText: "Username",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      controller: passwordController,
                    ),
                    RoundedButton(
                      text: "LOGIN",
                      press: () {},
                    ),
                  ],
                ),
              ),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    iconSrc: "assets/icons/google.svg",
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocialIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
