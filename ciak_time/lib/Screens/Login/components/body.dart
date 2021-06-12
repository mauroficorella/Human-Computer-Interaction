import 'package:ciak_time/Screens/Login/components/background.dart';
import 'package:ciak_time/Screens/Login/components/or_divider.dart';
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
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    RoundedButton(
                      text: "LOGIN",
                      radius: 29,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                              //return NavBar();
                              //return CustomNavBar();
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
                    press: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return new AlertDialog(
                            content: StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  width: size.width,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/icons/google.svg",
                                          height: size.height * 0.05),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Text(
                                        'Choose an account',
                                        style: TextStyle(
                                            fontSize: size.height * 0.025),
                                      ),
                                      SizedBox(height: size.height * 0.01,),
                                      Text(
                                        'to continue to CiakTime',
                                        style: TextStyle(
                                            fontSize: size.height * 0.018),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      Container(
                                        child: ListView.builder( //TODO cambiare struttura ultimo elemento
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: googleAccountsData.length, //setLenght(list),
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: GestureDetector(
                                              child: Column(
                                                children: [
                                                  
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Colors.white,
                                                        radius: size.width * 0.05,
                                                        backgroundImage: AssetImage(
                                                            googleAccountsData[index]['pic']),
                                                      ),
                                                      SizedBox(
                                                        width: size.width * 0.05,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            googleAccountsData[index]['name'],
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(googleAccountsData[index]['mail'], style: TextStyle(color: Colors.grey[600], fontSize: size.height * 0.015),),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Divider(color: googleAccountsData[index]['dividercolor'],)
                                                ],
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
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
