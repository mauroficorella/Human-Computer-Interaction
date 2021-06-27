import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegistrationPasswordField extends StatefulWidget {
  final String label;
  final ValueChanged<String> onChanged;

  const RegistrationPasswordField({
    Key key,
    @required this.label,
    this.onChanged,
  }) : super(key: key);

  @override
  _RegistrationPasswordField createState() => _RegistrationPasswordField();
}

class _RegistrationPasswordField extends State<RegistrationPasswordField> {
  bool isHidden = true;
  final passwordController = TextEditingController();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-_])',
        errorText: 'Password must have at least one special character')
  ]);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TextFieldContainer(
          child: Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              TextFormField(
                onChanged: widget.onChanged,
                controller: passwordController,
                validator: passwordValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: isHidden,
                decoration: InputDecoration(
                  hintText: widget.label,
                  hintStyle: TextStyle(
                    fontSize: size.height * 0.015,
                    fontFamily: 'Quicksand',
                  ),
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.visiblePassword,
                autofillHints: [AutofillHints.password],
                onEditingComplete: () => TextInput.finishAutofillContext(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  CupertinoButton(
                      minSize: double.minPositive,
                      padding: EdgeInsets.zero,
                      child: isHidden
                          ? Icon(Icons.visibility_off,
                              color: kPrimaryColor, size: size.height * 0.025)
                          : Icon(Icons.visibility,
                              color: kPrimaryColor, size: size.height * 0.025),
                      onPressed: () {
                        setState(() {
                          togglePasswordVisibility();
                        });
                      }),
                  CupertinoButton(
                      minSize: double.minPositive,
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Icon(Icons.info,
                          color: kPrimaryColor, size: size.height * 0.025),
                      onPressed: () {
                        setState(
                          () {
                            FocusManager.instance.primaryFocus.unfocus();
                            showDialog(
                              context: context,
                              builder: (_) {
                                return new AlertDialog(
                                  content: StatefulBuilder(
                                    builder: (context, setState) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
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
                                                    fontSize:
                                                        size.height * 0.02,
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
      ],
    );
  }

  void togglePasswordVisibility() => setState(() {
        isHidden = !isHidden;
      });
}
