import 'dart:async';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:ciak_time/Screens/User/profile_pic.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/components/social_icon.dart';
import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class UnMatchValidator extends TextFieldValidator {
  String string;
  // pass the error text to the super constructor
  UnMatchValidator(
      {String errorText = 'Username already in use', @required this.string})
      : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String value) {
    // return true if the value is valid according the your condition
    return !hasMatch(string, value);
  }
}

class IsMatchValidator extends TextFieldValidator {
  // pass the error text to the super constructor
  IsMatchValidator({
    String errorText = 'Password and confirm password must be equal',
  }) : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String value) {
    // return true if the value is valid according the your condition
    return value == newPassword;
  }
}

class IsNotMatchValidator extends TextFieldValidator {
  // pass the error text to the super constructor
  IsNotMatchValidator({
    String errorText = 'Password already in use',
  }) : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String value) {
    // return true if the value is valid according the your condition
    return value != oldPassword;
  }
}

class PassMatchValidator extends TextFieldValidator {
  bool isMatch = false;
  // pass the error text to the super constructor
  PassMatchValidator({
    String errorText = 'Incorrect password',
  }) : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String value) {
    // return true if the value is valid according the your condition
    for (var i = 0; i < users.length; i++) {
      if (userlogged == users[i]['username']) {
        isMatch = users[i]['password'] == value;
      }
    }
    return isMatch;
  }
}

class UserSettings extends StatefulWidget {
  const UserSettings({
    Key key,
  }) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  bool isOldHidden = true;
  bool isNewHidden = true;
  bool isNewConfirmHidden = true;
  final usernameController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordConfirmController = TextEditingController();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-_])',
        errorText: 'Password must have at least one special character')
  ]);

  var newPasswordValidator = MultiValidator([
    IsNotMatchValidator(),
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-_])',
        errorText: 'Password must have at least one special character'),
  ]);

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final usernameValidator = MultiValidator([
      RequiredValidator(errorText: 'Insert a valid username'),
      UnMatchValidator(string: userlogged),
    ]);

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(child: ProfilePic()),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userlogged,
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: 'Quicksand-Regular'),
                  ),
                  SizedBox(width: size.width * 0.02),
                  IconButton(
                    onPressed: () {
                      setState(
                        () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFieldContainer(
                                          child: TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                usermodified = value;
                                              });
                                            },
                                            controller: usernameController,
                                            validator: usernameValidator,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.person,
                                                color: kPrimaryColor,
                                              ),
                                              hintText: 'Choose a new username',
                                              hintStyle: TextStyle(
                                                fontSize: size.height * 0.02,
                                                fontFamily: 'Quicksand',
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: size.width * 0.3,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(29),
                                                child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    primary: Colors.white,
                                                    minimumSize: Size(
                                                        size.width * 0.25,
                                                        size.height * 0.05),
                                                    backgroundColor:
                                                        Colors.white,
                                                    side: BorderSide(
                                                        color: kPrimaryColor,
                                                        width: 2),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  29)),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        .unfocus();
                                                    usernameController.clear();
                                                    usermodified = '';
                                                    buttonModifyUserColor =
                                                        Colors.grey[300];
                                                    buttonModifyUserTextColor =
                                                        Colors.grey;
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'BACK',
                                                    style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontFamily: 'Quicksand',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: size.width * 0.3,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(29),
                                                child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    primary: Colors.white,
                                                    minimumSize: Size(
                                                        size.width * 0.25,
                                                        size.height * 0.05),
                                                    backgroundColor:
                                                        setButtonColor(),
                                                    side: BorderSide(
                                                        color: setButtonColor(),
                                                        width: 2),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  29)),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    if (usermodified
                                                            .isNotEmpty &&
                                                        userlogged !=
                                                            usermodified) {
                                                      setState(() {
                                                        userlogged =
                                                            usermodified;
                                                      });
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          .unfocus();
                                                      usernameController
                                                          .clear();
                                                      Navigator.pop(context);
                                                    } else {
                                                      showOkAlertDialog(
                                                          context: context,
                                                          title:
                                                              'You have to specify a new username');
                                                    }
                                                  },
                                                  child: Text(
                                                    'SAVE',
                                                    style: TextStyle(
                                                      color:
                                                          setButtonTextColor(),
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontFamily: 'Quicksand',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ).then(onGoBack);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Change password',
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: 'Quicksand-Regular'),
                  ),
                  SizedBox(width: size.width * 0.02),
                  IconButton(
                    onPressed: () {
                      setState(
                        () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFieldContainer(
                                          child: Stack(
                                            alignment: Alignment.centerRight,
                                            children: [
                                              TextFormField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    oldPassword = value;
                                                  });
                                                },
                                                controller:
                                                    oldPasswordController,
                                                validator: PassMatchValidator(),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                obscureText: isOldHidden,
                                                decoration: InputDecoration(
                                                  icon: Icon(
                                                    Icons.lock,
                                                    color: kPrimaryColor,
                                                  ),
                                                  hintText:
                                                      'Insert current password',
                                                  hintStyle: TextStyle(
                                                    fontSize:
                                                        size.height * 0.015,
                                                    fontFamily: 'Quicksand',
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  CupertinoButton(
                                                      minSize:
                                                          double.minPositive,
                                                      padding: EdgeInsets.zero,
                                                      child: isOldHidden
                                                          ? Icon(
                                                              Icons
                                                                  .visibility_off,
                                                              color:
                                                                  kPrimaryColor,
                                                              size:
                                                                  size.height *
                                                                      0.025)
                                                          : Icon(
                                                              Icons.visibility,
                                                              color:
                                                                  kPrimaryColor,
                                                              size:
                                                                  size.height *
                                                                      0.025),
                                                      onPressed: () {
                                                        setState(() {
                                                          toggleOldPasswordVisibility();
                                                        });
                                                      }),
                                                  CupertinoButton(
                                                      minSize:
                                                          double.minPositive,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              3.0,
                                                              0.0,
                                                              0.0,
                                                              0.0),
                                                      child: Icon(Icons.info,
                                                          color: kPrimaryColor,
                                                          size: size.height *
                                                              0.025),
                                                      onPressed: () {
                                                        setState(
                                                          () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (_) {
                                                                return new AlertDialog(
                                                                  content:
                                                                      StatefulBuilder(
                                                                    builder:
                                                                        (context,
                                                                            setState) {
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.info,
                                                                                color: kPrimaryColor,
                                                                              ),
                                                                              SizedBox(
                                                                                width: size.width * 0.05,
                                                                              ),
                                                                              Container(
                                                                                width: size.width * 0.5,
                                                                                child: Text(
                                                                                  "Insert your current password.",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: size.height * 0.02,
                                                                                    fontFamily: 'Quicksand',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      }),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextFieldContainer(
                                          child: Stack(
                                            alignment: Alignment.centerRight,
                                            children: [
                                              TextFormField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    newPassword = value;
                                                  });
                                                },
                                                controller:
                                                    newPasswordController,
                                                validator: newPasswordValidator,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                obscureText: isNewHidden,
                                                decoration: InputDecoration(
                                                  icon: Icon(
                                                    Icons.lock,
                                                    color: kPrimaryColor,
                                                  ),
                                                  hintText:
                                                      'Choose a new password',
                                                  hintStyle: TextStyle(
                                                    fontSize:
                                                        size.height * 0.015,
                                                    fontFamily: 'Quicksand',
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  CupertinoButton(
                                                      minSize:
                                                          double.minPositive,
                                                      padding: EdgeInsets.zero,
                                                      child: isNewHidden
                                                          ? Icon(
                                                              Icons
                                                                  .visibility_off,
                                                              color:
                                                                  kPrimaryColor,
                                                              size:
                                                                  size.height *
                                                                      0.025)
                                                          : Icon(
                                                              Icons.visibility,
                                                              color:
                                                                  kPrimaryColor,
                                                              size:
                                                                  size.height *
                                                                      0.025),
                                                      onPressed: () {
                                                        setState(() {
                                                          toggleNewPasswordVisibility();
                                                        });
                                                      }),
                                                  CupertinoButton(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              3, 0.0, 0.0, 0.0),
                                                      minSize:
                                                          double.minPositive,
                                                      child: Icon(Icons.info,
                                                          color: kPrimaryColor,
                                                          size: size.height *
                                                              0.025),
                                                      onPressed: () {
                                                        setState(
                                                          () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (_) {
                                                                return new AlertDialog(
                                                                  content:
                                                                      StatefulBuilder(
                                                                    builder:
                                                                        (context,
                                                                            setState) {
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.info,
                                                                                color: kPrimaryColor,
                                                                              ),
                                                                              SizedBox(
                                                                                width: size.width * 0.05,
                                                                              ),
                                                                              Container(
                                                                                width: size.width * 0.5,
                                                                                child: Text(
                                                                                  "The password must have at least 8 characters and at least one special character.",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: size.height * 0.02,
                                                                                    fontFamily: 'Quicksand',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      }),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextFieldContainer(
                                          child: Stack(
                                            alignment: Alignment.centerRight,
                                            children: [
                                              TextFormField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    newConfirmPassword = value;
                                                  });
                                                },
                                                controller:
                                                    newPasswordConfirmController,
                                                validator: IsMatchValidator(),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                obscureText: isNewConfirmHidden,
                                                decoration: InputDecoration(
                                                  icon: Icon(
                                                    Icons.lock,
                                                    color: kPrimaryColor,
                                                  ),
                                                  hintText:
                                                      'Confirm new password',
                                                  hintStyle: TextStyle(
                                                    fontSize:
                                                        size.height * 0.015,
                                                    fontFamily: 'Quicksand',
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  CupertinoButton(
                                                      minSize:
                                                          double.minPositive,
                                                      padding: EdgeInsets.zero,
                                                      child: isNewConfirmHidden
                                                          ? Icon(
                                                              Icons
                                                                  .visibility_off,
                                                              color:
                                                                  kPrimaryColor,
                                                              size:
                                                                  size.height *
                                                                      0.025)
                                                          : Icon(
                                                              Icons.visibility,
                                                              color:
                                                                  kPrimaryColor,
                                                              size:
                                                                  size.height *
                                                                      0.025),
                                                      onPressed: () {
                                                        setState(() {
                                                          toggleNewConfirmPasswordVisibility();
                                                        });
                                                      }),
                                                  CupertinoButton(
                                                      minSize:
                                                          double.minPositive,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              3.0,
                                                              0.0,
                                                              0.0,
                                                              0.0),
                                                      child: Icon(Icons.info,
                                                          color: kPrimaryColor,
                                                          size: size.height *
                                                              0.025),
                                                      onPressed: () {
                                                        setState(
                                                          () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (_) {
                                                                return new AlertDialog(
                                                                  content:
                                                                      StatefulBuilder(
                                                                    builder:
                                                                        (context,
                                                                            setState) {
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.info,
                                                                                color: kPrimaryColor,
                                                                              ),
                                                                              SizedBox(
                                                                                width: size.width * 0.05,
                                                                              ),
                                                                              Container(
                                                                                width: size.width * 0.5,
                                                                                child: Text(
                                                                                  "This password must be equal to the new password.",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: size.height * 0.02,
                                                                                    fontFamily: 'Quicksand',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      }),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: size.width * 0.3,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(29),
                                                child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    primary: Colors.white,
                                                    minimumSize: Size(
                                                        size.width * 0.25,
                                                        size.height * 0.05),
                                                    backgroundColor:
                                                        Colors.white,
                                                    side: BorderSide(
                                                        color: kPrimaryColor,
                                                        width: 2),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  29)),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        .unfocus();
                                                    oldPasswordController
                                                        .clear();
                                                    newPasswordController
                                                        .clear();
                                                    newPasswordConfirmController
                                                        .clear();
                                                    oldPassword = '';
                                                    newPassword = '';
                                                    newConfirmPassword = '';
                                                    setButtonPasswordColor();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'BACK',
                                                    style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontFamily: 'Quicksand',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: size.width * 0.3,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(29),
                                                child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    primary: Colors.white,
                                                    minimumSize: Size(
                                                        size.width * 0.25,
                                                        size.height * 0.05),
                                                    backgroundColor:
                                                        setButtonPasswordColor(),
                                                    side: BorderSide(
                                                        color:
                                                            setButtonPasswordColor(),
                                                        width: 2),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  29)),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    String pass;
                                                    for (var i = 0;
                                                        i < users.length;
                                                        i++) {
                                                      if (userlogged ==
                                                          users[i]
                                                              ['username']) {
                                                        pass = users[i]
                                                            ['password'];
                                                      }
                                                      if (newPassword.isNotEmpty &&
                                                          oldPassword
                                                              .isNotEmpty &&
                                                          newConfirmPassword
                                                              .isNotEmpty &&
                                                          newPassword ==
                                                              newConfirmPassword &&
                                                          oldPassword == pass &&
                                                          newPassword !=
                                                              oldPassword) {
                                                        setState(() {
                                                          users[i]['password'] =
                                                              newPassword;
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              .unfocus();

                                                          newPasswordController
                                                              .clear();
                                                          oldPasswordController
                                                              .clear();
                                                          newPasswordConfirmController
                                                              .clear();
                                                        });
                                                        Navigator.pop(context);
                                                      } else {
                                                        showOkAlertDialog(
                                                            context: context,
                                                            title:
                                                                'You have to specify a new password');
                                                      }
                                                    }
                                                  },
                                                  child: Text(
                                                    'SAVE',
                                                    style: TextStyle(
                                                      color:
                                                          setButtonTextPasswordColor(),
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontFamily: 'Quicksand',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ).then(onGoBack);
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
                height: size.height * 0.08,
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
                    socialFlag: googleConnected,
                    iconSrc: "assets/icons/google.svg",
                    press: () {
                      if (!googleConnected) {
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
                                            itemCount:
                                                googleAccountsData.length,
                                            itemBuilder: (BuildContext context,
                                                    int index) =>
                                                Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      googleConnected = true;
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
                                                        index]['dividercolor'],
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
                        ).then(onGoBack);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Google account already connected');
                      }
                    },
                  ),
                  SocialIcon(
                    socialFlag: facebookConnected,
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {
                      if (!facebookConnected) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return new AlertDialog(
                              content: StatefulBuilder(
                                builder: (context, setState) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
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
                                          facebookConnected = true;
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
                                  );
                                },
                              ),
                            );
                          },
                        ).then(onGoBack);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Facebook account already connected');
                      }
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
                            return Column(
                              mainAxisSize: MainAxisSize.min,
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
                                          minimumSize: Size(size.width * 0.1,
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
                                          minimumSize: Size(size.width * 0.1,
                                              size.height * 0.005),
                                          padding: EdgeInsets.all(0.0),
                                        ),
                                        onPressed: () {
                                          googleConnected = false;
                                          facebookConnected = false;
                                          isUserLogged = false;
                                          Navigator.popUntil(context,
                                              ModalRoute.withName('/'));
                                          username = '';
                                          password = '';

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
                                ),
                              ],
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
      ),
    );
  }

  Color setButtonColor() {
    if (usermodified != '' && userlogged != usermodified) {
      buttonModifyUserColor = kPrimaryColor;
    } else {
      buttonModifyUserColor = Colors.grey[300];
    }
    return buttonModifyUserColor;
  }

  Color setButtonTextColor() {
    if (usermodified.isNotEmpty && userlogged != usermodified) {
      buttonModifyUserTextColor = Colors.white;
    } else {
      buttonModifyUserTextColor = Colors.grey;
    }

    return buttonModifyUserTextColor;
  }

  Color setButtonPasswordColor() {
    String pass;
    for (var i = 0; i < users.length; i++) {
      if (userlogged == users[i]['username']) {
        pass = users[i]['password'];
      }
    }
    if (newPassword.isNotEmpty &&
        oldPassword.isNotEmpty &&
        newConfirmPassword.isNotEmpty &&
        newPassword == newConfirmPassword &&
        oldPassword == pass &&
        newPassword != oldPassword) {
      buttonPasswordColor = kPrimaryColor;
    } else {
      buttonPasswordColor = Colors.grey[300];
    }
    return buttonPasswordColor;
  }

  Color setButtonTextPasswordColor() {
    String pass;
    for (var i = 0; i < users.length; i++) {
      if (userlogged == users[i]['username']) {
        pass = users[i]['password'];
      }
    }
    if (newPassword.isNotEmpty &&
        oldPassword.isNotEmpty &&
        newConfirmPassword.isNotEmpty &&
        newPassword == newConfirmPassword &&
        oldPassword == pass &&
        newPassword != oldPassword) {
      buttonPasswordTextColor = Colors.white;
    } else {
      buttonPasswordTextColor = Colors.grey;
    }

    return buttonPasswordTextColor;
  }

  void toggleOldPasswordVisibility() => setState(() {
        isOldHidden = !isOldHidden;
      });

  void toggleNewPasswordVisibility() => setState(() {
        isNewHidden = !isNewHidden;
      });

  void toggleNewConfirmPasswordVisibility() => setState(() {
        isNewConfirmHidden = !isNewConfirmHidden;
      });
}
