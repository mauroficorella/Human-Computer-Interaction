import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RoundedModifyUsernameField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedModifyUsernameField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedModifyUsernameFieldState createState() => _RoundedModifyUsernameFieldState();
}

class _RoundedModifyUsernameFieldState extends State<RoundedModifyUsernameField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
      child: TextFormField(
        //onSubmitted: (value) => username = value,
        onChanged: widget.onChanged,
        validator: (value) {
          for (var i = 0; i < users.length; i++) {
            if (value == userlogged) {
              return MatchValidator(
                      errorText: 'The inserted username already exists')
                  .validateMatch(
                value,
                userlogged,
              );
            }
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: size.height * 0.02,
            fontFamily: 'Quicksand',
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
