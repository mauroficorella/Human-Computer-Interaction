import 'dart:io';

import 'package:ciak_time/Screens/Login/login_screen.dart';
import 'package:ciak_time/Screens/User/profile_pic.dart';
import 'package:ciak_time/components/change_password_field.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/components/rounded_input_field.dart';

import 'package:ciak_time/components/social_icon.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String username = "Vittoria";
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "User",
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.2,
        title: Text(
          'Settings',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(child: ProfilePic()),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: 'Quicksand-Regular'),
                      ),
                      SizedBox(width: size.width * 0.02),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return new AlertDialog(
                                content: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Container(
                                      height: size.height * 0.18,
                                      width: size.width,
                                      child: Column(
                                        children: [
                                          RoundedInputField(
                                            hintText: "Choose new username",
                                            onChanged: (value) {},
                                          ),
                                          Container(
                                            child: RoundedButton(
                                                text: "SAVE",
                                                radius: 29,
                                                press: () {
                                                  setState(() {
                                                    username = "prova";
                                                  });
                                                  Navigator.pop(context);
                                                }),
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
                        icon: SvgPicture.asset("assets/icons/edit.svg"),
                        iconSize: size.height * 0.035,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: 'Quicksand-Regular'),
                      ),
                      SizedBox(width: size.width * 0.02),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return new AlertDialog(
                                content: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Container(
                                      height: size.height * 0.26,
                                      width: size.width,
                                      child: Column(
                                        children: [
                                          ChangePasswordField(
                                              controller: passwordController,
                                              label: "Choose new password"),
                                          ChangePasswordField(
                                              controller: passwordController,
                                              label: "Confirm password"),
                                          RoundedButton(
                                              text: "SAVE",
                                              radius: 29,
                                              press: () {
                                                Navigator.pop(context);
                                              })
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        icon: SvgPicture.asset("assets/icons/edit.svg"),
                        iconSize: size.height * 0.035,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.13,
                  ),
                  Center(
                    child: Text(
                      "CONNECT AN ACCOUNT:",
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontFamily: 'Quicksand-Regular',
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                              itemBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        //socialSelected = true;
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Google account connected successfully");
                                                        Navigator.pop(context);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            radius: size.width *
                                                                0.05,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    googleAccountsData[
                                                                            index]
                                                                        [
                                                                        'pic']),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.05,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                googleAccountsData[
                                                                        index]
                                                                    ['name'],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                googleAccountsData[
                                                                        index]
                                                                    ['mail'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontSize: size
                                                                            .height *
                                                                        0.015),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: googleAccountsData[
                                                              index]
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
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                              //socialSelected = true;
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Facebook account connected successfully");
                                              Navigator.pop(context);
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
                  SizedBox(height: size.height * 0.01),
                  RoundedButton(
                    text: "LOGOUT",
                    radius: 29,
                    press: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return new AlertDialog(
                            content: StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  height: size.height * 0.11,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Do you really want to logout?",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.height * 0.02,
                                          fontFamily: 'Quicksand',
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.028,
                                      ),
                                      Container(
                                        width: size.width * 0.7,
                                        height: size.height * 0.03,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton.icon(
                                              icon: Icon(
                                                Icons.dangerous_outlined,
                                                color: Colors.red,
                                              ),
                                              style: TextButton.styleFrom(
                                                minimumSize: Size(
                                                    size.width * 0.1,
                                                    size.height * 0.005),
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              label: Text(
                                                "NO",
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: size.height * 0.02,
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            TextButton.icon(
                                              icon: Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                              style: TextButton.styleFrom(
                                                minimumSize: Size(
                                                    size.width * 0.1,
                                                    size.height * 0.005),
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        new LoginScreen(),
                                                  ),
                                                );

                                                FlutterStatusbarcolor
                                                    .setStatusBarColor(
                                                        Colors.transparent);
                                              },
                                              label: Text(
                                                "YES",
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: size.height * 0.02,
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
