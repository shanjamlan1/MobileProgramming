import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String textHeader;
  final double width;
  const Header({
    Key key,
    this.textHeader,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$textHeader',
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xffff3248)),
        )
      ],
    );
  }
}
