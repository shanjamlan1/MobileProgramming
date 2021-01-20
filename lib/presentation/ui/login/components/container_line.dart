import 'package:flutter/material.dart';

class ContainerLine extends StatelessWidget {
  const ContainerLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
    );
  }
}
