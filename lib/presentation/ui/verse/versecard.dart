import 'package:flutter/material.dart';
import 'package:mob_prog_project/data/verse/verse.dart';

class VerseCard extends StatelessWidget {
  const VerseCard(
      {Key key,
      this.onTap,
      @required this.item,
      this.addToFavorite,
      this.verse,
      this.navigationToReadPage})
      : super(key: key);

  final Verse verse;

  final VoidCallback onTap;

  final Verse item;

  final Function navigationToReadPage;

  final Function addToFavorite;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Card(
        color: Colors.white,
        child: ListTile(
          onTap: navigationToReadPage,
          title: Column(
            children: [
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(verse.sentence,
                        style: Theme.of(context).textTheme.title),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(verse.author,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5))),
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: addToFavorite,
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
