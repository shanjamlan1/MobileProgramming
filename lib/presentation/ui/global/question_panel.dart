import 'package:flutter/material.dart';

class QuestionPanel extends StatelessWidget {
  final String text;
  final String routeText;
  final Function function;
  const QuestionPanel({
    Key key,
    this.text,
    this.routeText,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$text'),
          FlatButton(
              onPressed: function,
              child: Text('$routeText',
                  style: TextStyle(color: Color(0xffff3248))))
        ],
      ),
    );
  }
}
