import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class IsMatchValidator extends TextFieldValidator {
  String string;
  // pass the error text to the super constructor
  IsMatchValidator(
      {String errorText = 'Password and confirm password must be equal',
      @required this.string})
      : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String value) {
    
    // return true if the value is valid according the your condition
    return string == value;
  }
}

class RegistrationPasswordFieldConfirm extends StatefulWidget {
  final String label;
  final ValueChanged<String> onChanged;

  const RegistrationPasswordFieldConfirm({
    Key key,
    @required this.label, this.onChanged,
  }) : super(key: key);

  @override
  _RegistrationPasswordFieldConfirm createState() =>
      _RegistrationPasswordFieldConfirm();
}

class _RegistrationPasswordFieldConfirm
    extends State<RegistrationPasswordFieldConfirm> {
  bool isHidden = true;
  final passwordController = TextEditingController();
  
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
                validator: passwordConfirmValidator,
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
                  IconButton(
                    icon: isHidden
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: togglePasswordVisibility,
                    color: kPrimaryColor,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    splashRadius: 10,
                    onPressed: () {
                      setState(
                        () {
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
                                                "This password must be equal to the one in the previous field.",
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
                    },
                    icon: Icon(
                      Icons.info,
                      color: kPrimaryColor,
                    ),
                  ),
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
