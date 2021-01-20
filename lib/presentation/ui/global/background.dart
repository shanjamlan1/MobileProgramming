import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xffff3248),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(29.0),
                    topLeft: Radius.circular(29.0)),
              ),
              height: size.height * 0.9,
              width: size.width,
              child: Text(''),
            ),
          ),
          child
        ],
      ),
    );
  }
}
