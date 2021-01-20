import 'package:flutter/material.dart';
import 'package:mob_prog_project/data/plan/plan.dart';

class PlansCard extends StatelessWidget {
  final Plan plans;

  final Plan item;

  final bool selected;

  const PlansCard({Key key, this.plans, this.item, this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return SingleChildScrollView(
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            new Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(plans.image)),
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plans.title, style: Theme.of(context).textTheme.title),
                  Text(plans.verse,
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(plans.author)),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(plans.text),
                  ),
                ],
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
