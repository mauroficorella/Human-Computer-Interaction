import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const RoundedPasswordField({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  _RoundedPasswordField createState() => _RoundedPasswordField();
}

class _RoundedPasswordField extends State<RoundedPasswordField> {
  bool isHidden = true;

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
                autofillHints: [AutofillHints.password],
                onEditingComplete: () => TextInput.finishAutofillContext(),
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
