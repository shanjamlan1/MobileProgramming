import 'package:flutter/material.dart';
import 'package:mob_prog_project/data/plan/plan.dart';

class PlansFavoriteCard extends StatelessWidget {
  const PlansFavoriteCard(
      {Key key,
      this.plans,
      this.onTap,
      @required this.item,
      this.selected: false,
      this.navigationToPlanPage,
      this.removeToFavorite})
      : super(key: key);

  final Plan plans;

  final VoidCallback onTap;

  final Plan item;

  final bool selected;

  final Function navigationToPlanPage;

  final Function removeToFavorite;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
        color: Colors.white,
        child: ListTile(
          onTap: navigationToPlanPage,
          title: Column(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: removeToFavorite,
                          iconSize: 40.0,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ));
  }
}
