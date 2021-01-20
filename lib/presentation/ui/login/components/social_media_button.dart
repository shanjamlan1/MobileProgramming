import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String text;
  final Function function;
  final Color color, textColor;
  final Icon icon;

  const SocialMediaButton(
      {Key key,
      this.text,
      this.function,
      this.color,
      this.textColor,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          onPressed: () => function,
          textColor: textColor,
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
              side: BorderSide(color: textColor)),
          child: Row(
            children: <Widget>[
              icon,
              SizedBox(
                width: 10,
              ),
              Text(
                '$text',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
