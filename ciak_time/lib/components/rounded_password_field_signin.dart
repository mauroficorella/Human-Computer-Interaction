import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedPasswordFieldSignIn extends StatefulWidget {
  final TextEditingController controller;
  const RoundedPasswordFieldSignIn({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  _RoundedPasswordField createState() => _RoundedPasswordField();
}

class _RoundedPasswordField extends State<RoundedPasswordFieldSignIn> {
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
                      showDialog(
                        context: context,
                        builder: (_) {
                          return new AlertDialog(
                            content: StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  child: Row(
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
                                          "The password must have at least 8 characters, at least 1 digit.",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.02,
                                            fontFamily: 'Quicksand',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
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
        //FocusScope.of(context).unfocus();
      });
}
