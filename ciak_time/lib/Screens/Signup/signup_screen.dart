import 'package:ciak_time/Screens/Signup/components/background.dart';
import 'package:ciak_time/components/already_have_an_account_check.dart';
import 'package:ciak_time/components/password_field.dart';
import 'package:ciak_time/components/password_field_confirm.dart';
import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Background(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: SingleChildScrollView(
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
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
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
                            RequiredValidator(
                                errorText: 'Password is required'),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          color: _setRegistrationButtonColor(),
                          onPressed: () {
                            setState(() {
                            if (email != '' &&
                                userregistered != '' &&
                                passwordRegistration != '' &&
                                passwordRegistrationConfirm != '') {
                              users.add({
                                'username': userregistered,
                                'password': passwordRegistration,
                              });
                            } else {}

                            
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
                      height: size.height * 0.078,
                    ),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
  Color _setRegistrationButtonColor() {
    setState(() {
    
    for (var i = 0; i < users.length; i++) {
      if (userregistered.isNotEmpty &&
          userregistered != users[i]['username'] &&
          regexMail.hasMatch(email) &&
          regexPassword.hasMatch(passwordRegistration) &&
          regexPassword.hasMatch(passwordRegistrationConfirm) &&
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
      
      if (userregistered.isNotEmpty &&
          userregistered != users[i]['username'] &&
          regexMail.hasMatch(email) &&
          regexPassword.hasMatch(passwordRegistration) &&
          regexPassword.hasMatch(passwordRegistrationConfirm) &&
          passwordRegistration == passwordRegistrationConfirm &&
          email.isNotEmpty &&
          passwordRegistration.isNotEmpty &&
          passwordRegistrationConfirm.isNotEmpty) {
        buttonRegisterColor = Colors.white;
      } else {
        buttonRegisterColor = Colors.grey;
      }
    }
    });

    return buttonRegisterColor;
  }
}
