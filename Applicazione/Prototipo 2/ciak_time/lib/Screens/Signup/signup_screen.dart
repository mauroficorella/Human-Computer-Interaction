import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:ciak_time/Screens/Login/login_screen.dart';
import 'package:ciak_time/Screens/Signup/components/background.dart';
import 'package:ciak_time/components/password_field.dart';
import 'package:ciak_time/components/password_field_confirm.dart';
import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final usernameValidator = MultiValidator([
    RequiredValidator(errorText: 'Insert a valid username'),
    UnMatchValidator(string: users[0]['username']),
  ]);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                primary: Colors.transparent,
                //elevation: 0.0,
                /*minimumSize:
                            Size(size.width * 0.1, size.height * 0.005),
                        padding: EdgeInsets.all(0.0),*/
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: new Icon(Icons.arrow_back_ios, color: kPrimaryColor),
              label: Text(
                'Sign In',
                style: TextStyle(
                    color: kPrimaryColor, fontFamily: 'Quicksand-Regular'),
              ),
            ),
            leadingWidth: size.width * 0.23,
          ),
        ),
        Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: size.width * 0.75,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.03,
                        fontFamily: 'Quicksand-Medium',
                        color: kPrimaryColor),
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator:
                        EmailValidator(errorText: 'Insert a valid email'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: kPrimaryColor,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontSize: size.height * 0.02,
                        fontFamily: 'Quicksand',
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        userregistered = value;
                      });
                    },
                    validator: usernameValidator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: "Username",
                      hintStyle: TextStyle(
                        fontSize: size.height * 0.02,
                        fontFamily: 'Quicksand',
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                RegistrationPasswordField(
                  label: 'Insert a password',
                  onChanged: (value) {
                    setState(() {
                      passwordRegistration = value;
                      passwordConfirmValidator = MultiValidator([
                        RequiredValidator(errorText: 'Password is required'),
                        MinLengthValidator(8,
                            errorText:
                                'Password must be at least 8 digits long'),
                        PatternValidator(passwordPattern,
                            errorText:
                                'Password must have at least one special character'),
                        IsMatchValidator(string: passwordRegistration)
                      ]);
                    });
                  },
                ),
                RegistrationPasswordFieldConfirm(
                  label: 'Confirm password',
                  onChanged: (value) {
                    setState(() {
                      passwordRegistrationConfirm = value;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      color: _setRegistrationButtonColor(),
                      onPressed: () {
                        setState(() {
                          FocusManager.instance.primaryFocus.unfocus();

                          loginUsernameController.clear();

                          loginPasswordController.clear();
                          if (email != '' &&
                              userregistered != '' &&
                              passwordRegistration != '' &&
                              passwordRegistrationConfirm != '') {
                            username = userregistered;
                            password = passwordRegistration;
                            users.add({
                              'username': userregistered,
                              'password': passwordRegistration,
                            });

                            userlogged = userregistered;
                            userregistered = '';
                            passwordRegistration = '';
                            passwordRegistrationConfirm = '';
                            email = '';
                            
                            showOkAlertDialog(
                                    context: context,
                                    title: 'Registration successfull')
                                .then((value) {
                              Navigator.popUntil(
                                  context, ModalRoute.withName('/'));
                            });
                            
                          } else {
                            showOkAlertDialog(
                                context: context,
                                title: "Registration error",
                                message:
                                    "You need to fill all the fields in order to register.");
                          }
                        });
                      },
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          color: _setRegistrationButtonTextColor(),
                          fontSize: size.width * 0.05,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an Account? ",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.transparent,
                        minimumSize:
                            Size(size.width * 0.1, size.height * 0.005),
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        ).then((value) {
                          FocusManager.instance.primaryFocus.unfocus();

                          loginUsernameController.clear();

                          loginPasswordController.clear();
                        });
                      },
                      child: Text("Sign In",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Color _setRegistrationButtonColor() {
    setState(() {
      for (var i = 0; i < users.length; i++) {
        if (userregistered.isNotEmpty &&
            userregistered != users[i]['username'] &&
            regexMail.hasMatch(email) &&
            regexPassword.hasMatch(passwordRegistration) &&
            
            passwordRegistration == passwordRegistrationConfirm &&
            email.isNotEmpty &&
            passwordRegistration.isNotEmpty &&
            passwordRegistrationConfirm.isNotEmpty) {
          buttonRegisterColor = kPrimaryColor;
        } else {
          buttonRegisterColor = Colors.grey[300];
        }
      }
    });

    return buttonRegisterColor;
  }

  Color _setRegistrationButtonTextColor() {
    setState(() {
      for (var i = 0; i < users.length; i++) {
        if (userregistered != '' &&
            userregistered != users[i]['username'] &&
            regexMail.hasMatch(email) &&
            regexPassword.hasMatch(passwordRegistration) &&
          
            passwordRegistration == passwordRegistrationConfirm &&
            email != '' &&
            passwordRegistration != '' &&
            passwordRegistrationConfirm != '') {
          buttonRegisterColor = Colors.white;
        } else {
          buttonRegisterColor = Colors.grey;
        }
      }
    });

    return buttonRegisterColor;
  }
}
