import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isObscure;
  final TextEditingController myController;
  final Function validFunction;
  const RoundedTextField(
      {Key key,
      this.hintText,
      this.icon,
      this.isObscure,
      this.myController,
      this.validFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validFunction,
        obscureText: isObscure,
        controller: myController,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color(0xffff3248),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        style: TextStyle(color: Color(0xff42b883)));
  }
}
