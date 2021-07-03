import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RoundedInputField extends StatefulWidget {
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
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
      child: TextFormField(
        controller: loginUsernameController,
        onChanged: widget.onChanged,
        /*validator: (value) {
          
          for (var i = 0; i < users.length; i++) {
            
            if (username == users[i]['username'] ||
                (username != users[i]['username'] && i == users.length - 1 && username != '')) {
              return MatchValidator(
                      errorText: 'The inserted username does not exist')
                  .validateMatch(
                username,
                users[i]['username'],
              );
            }
            

          }
          
        },*/
        
        //autovalidateMode: AutovalidateMode.onUserInteraction,
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
