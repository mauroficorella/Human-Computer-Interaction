import 'package:ciak_time/Screens/Login/components/background.dart';
import 'package:ciak_time/Screens/Login/components/or_divider.dart';
import 'package:ciak_time/Screens/Movie/movie.dart';
import 'package:ciak_time/Screens/Signup/signup_screen.dart';
import 'package:ciak_time/Screens/navbar.dart';
import 'package:ciak_time/components/already_have_an_account_check.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/components/rounded_input_field.dart';
import 'package:ciak_time/components/rounded_password_field.dart';
import 'package:ciak_time/components/social_icon.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Text(
                "CiakTime",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.08,
                    fontFamily: 'Pattaya',
                    color: kPrimaryColor),
              ),
              SvgPicture.asset(
                "assets/icons/movie.svg",
                height: size.height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      //color: Colors.black,
                      width: size.width * 0.75,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.03,
                            fontFamily: 'Quicksand-Medium',
                            color: kPrimaryColor),
                      ),
                    ),
                    RoundedInputField(
                      hintText: "Username",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      controller: passwordController,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: size.width * 0.75,
                      height: size.height * 0.025,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize:
                              Size(size.width * 0.1, size.height * 0.005),
                          padding: EdgeInsets.all(0.0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: kPrimaryColor,
                            //fontSize: size.width * 0.03,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    RoundedButton(
                      text: "LOGIN",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NavBar();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
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
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Movie();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(),
            ],
          ),
        ),
      ),
    );
  }
}
