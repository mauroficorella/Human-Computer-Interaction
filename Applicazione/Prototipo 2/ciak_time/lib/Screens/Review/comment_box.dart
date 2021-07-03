import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  final Widget child;
  final dynamic formKey;
  final dynamic sendButtonMethod;
  final dynamic commentController;
  final String userImage;
  final String labelText;
  final String errorText;
  final Widget sendWidget;
  final Color backgroundColor;
  final Color textColor;
  final bool withBorder;
  final Widget header;
  final FocusNode focusNode;
  final ImageProvider<Object> backgroundImage;
  const CommentBox({ Key key, this.child,
      this.header,
      this.sendButtonMethod,
      this.formKey,
      this.commentController,
      this.sendWidget,
      this.userImage,
      this.labelText,
      this.focusNode,
      this.errorText,
      this.withBorder = true,
      this.backgroundColor,
      this.textColor, this.backgroundImage }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        Divider(
          height: 1,
        ),
        header ?? SizedBox.shrink(),
        ListTile(
          tileColor: backgroundColor,
          leading: Container(
            height: 40.0,
            width: 40.0,
            decoration: new BoxDecoration(
                color: Colors.blue,
                borderRadius: new BorderRadius.all(Radius.circular(50))),
            child: CircleAvatar(
                radius: 50, backgroundImage: backgroundImage),
          ),
          title: Form(
            key: formKey,
            child: TextFormField(
              maxLines: 4,
              minLines: 1,
              focusNode: focusNode,
              cursorColor: textColor,
              style: TextStyle(color: textColor),
              controller: commentController,
              decoration: InputDecoration(
                enabledBorder: !withBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor),
                      ),
                focusedBorder: !withBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor),
                      ),
                border: !withBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor),
                      ),
                labelText: labelText,
                focusColor: textColor,
                fillColor: textColor,
                labelStyle: TextStyle(color: textColor),
              ),
              validator: (value) => value.isEmpty ? errorText : null,
            ),
          ),
          trailing: GestureDetector(
            onTap: sendButtonMethod,
            child: sendWidget,
          ),
        ),
      ],
    );
  }
}