import 'package:ciak_time/Screens/Homescreen/homescreen.dart';
import 'package:ciak_time/Screens/Login/components/background.dart';
import 'package:ciak_time/Screens/Login/components/or_divider.dart';
import 'package:ciak_time/Screens/Login/login_screen.dart';
import 'package:ciak_time/Screens/navbar.dart';
import 'package:ciak_time/components/already_have_an_account_check.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/components/rounded_input_field.dart';
import 'package:ciak_time/components/rounded_password_field.dart';
import 'package:ciak_time/components/social_icon.dart';
import 'package:ciak_time/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
                      press: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.mobile) {
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
                        } else if (connectivityResult ==
                            ConnectivityResult.wifi) {
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
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return new AlertDialog(
                                content: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Container(
                                      child: Text("ciao")
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        }
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
                                  height: size.height * 0.4,
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
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                        'to continue to CiakTime',
                                        style: TextStyle(
                                            fontSize: size.height * 0.018),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      Container(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: googleAccountsData
                                              .length, //setLenght(list),
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return HomePage();
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius:
                                                            size.width * 0.05,
                                                        backgroundImage:
                                                            AssetImage(
                                                                googleAccountsData[
                                                                        index]
                                                                    ['pic']),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.05,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            googleAccountsData[
                                                                index]['name'],
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            googleAccountsData[
                                                                index]['mail'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[600],
                                                                fontSize:
                                                                    size.height *
                                                                        0.015),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color:
                                                      googleAccountsData[index]
                                                          ['dividercolor'],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16.0, 3.0, 0.0, 0.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.person_add_alt),
                                            SizedBox(
                                              width: size.width * 0.05,
                                            ),
                                            Text(
                                              "Add another account",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      )
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
                    press: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return new AlertDialog(
                            content: StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  height: size.height * 0.46,
                                  width: size.width,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/icons/facebook.svg",
                                          height: size.height * 0.05),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Text(
                                        'Login with facebook',
                                        style: TextStyle(
                                            fontSize: size.height * 0.025,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                        'to continue to CiakTime',
                                        style: TextStyle(
                                            fontSize: size.height * 0.018),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/vittoria.png'),
                                        radius: size.width * 0.1,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                        'Vittoria',
                                        style: TextStyle(
                                            fontSize: size.width * 0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return HomePage();
                                              },
                                            ),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.blue[800],
                                        ),
                                        child: Text(
                                          'Login with this account',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.width * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.03,
                                      ),
                                      Text(
                                        "Aren't you?",
                                        style: TextStyle(
                                            fontSize: size.width * 0.035),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Sign in with another account",
                                          style: TextStyle(
                                              color: Colors.blue[800],
                                              fontSize: size.width * 0.035),
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
