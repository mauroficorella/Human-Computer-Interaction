import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    @required this.controller,
    @required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordField createState() => _RoundedPasswordField();
}

class _RoundedPasswordField extends State<RoundedPasswordField> {
  bool isHidden = true;
  String password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final passwordValidator = MultiValidator([
      RequiredValidator(errorText: 'password is required'),
      MinLengthValidator(8,
          errorText: 'password must be at least 8 digits long'),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'passwords must have at least one special character')
    ]);
    return Column(
      children: [
        TextFieldContainer(
          child: Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              TextFormField(
                onChanged: widget.onChanged,
                controller: widget.controller,
                obscureText: isHidden,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: size.height * 0.02,
                    fontFamily: 'Quicksand',
                  ),
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.visiblePassword,
                //autofillHints: [AutofillHints.password],
                //onEditingComplete: () => TextInput.finishAutofillContext(),
                //onChanged: (val) => ,
                /*validator: (val) =>
                    MatchValidator(errorText: 'passwords do not match')
                        .validateMatch(
                  val,
                  'denitto',
                ),*/
                validator: (value) {
                  for (var i = 0; i < users.length; i++) {
                    if (username == users[i]['username']) {
                      return MatchValidator(errorText: 'passwords do not match')
                          .validateMatch(
                        value,
                        users[i]['password'],
                      );
                    }
                  }
                    
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              IconButton(
                icon: isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: togglePasswordVisibility,
                color: kPrimaryColor,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void togglePasswordVisibility() => setState(() {
        isHidden = !isHidden;
        //FocusScope.of(context).unfocus();
      });
}
