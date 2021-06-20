import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
      child: TextFormField(
        enabled: userEnabled,
        controller: loginUsernameController,
        onChanged: onChanged,
        validator: (value) {
          for (var i = 0; i < users.length; i++) {
            if (username != users[i]['username']) {
              return MatchValidator(
                      errorText: 'The inserted username does not exist')
                  .validateMatch(
                value,
                users[i]['username'],
              );
            }
          }
            
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
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
