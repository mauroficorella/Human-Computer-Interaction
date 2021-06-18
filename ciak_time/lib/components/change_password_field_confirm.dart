import 'package:ciak_time/components/text_field_container.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ChangePasswordFieldConfirm extends StatefulWidget {
  final String label;
  const ChangePasswordFieldConfirm({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldConfirm createState() => _RoundedPasswordFieldConfirm();
}

class _RoundedPasswordFieldConfirm extends State<ChangePasswordFieldConfirm> {
  bool isHidden = true;
  final passwordController = TextEditingController();
  final passwordValidator = MultiValidator([  
    RequiredValidator(errorText: 'password is required'),  
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),  
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')  
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
                controller: passwordController,
                validator: passwordValidator,
                autovalidateMode: AutovalidateMode.always,
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
