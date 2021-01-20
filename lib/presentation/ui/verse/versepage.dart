import 'package:flutter/material.dart';
import 'package:mob_prog_project/data/plan/plan.dart';
import 'package:mob_prog_project/data/verse/verse.dart';
import 'package:mob_prog_project/presentation/ui/plan_card/planview.dart';
import 'package:mob_prog_project/presentation/ui/verse/versecard.dart';
import 'package:mob_prog_project/presentation/ui/verse/verseedit.dart';

class VersePage extends StatelessWidget {
  final Verse verse;

  const VersePage({Key key, this.verse}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyVersePageState(
      verse: this.verse,
    );
  }
}

class MyVersePageState extends StatefulWidget {
  final Verse verse;

  const MyVersePageState({Key key, this.verse}) : super(key: key);

  _MyVersePageState createState() => _MyVersePageState(verse: this.verse);
}

class _MyVersePageState extends State<MyVersePageState> {
  final Verse verse;

  _MyVersePageState({this.verse});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff3248),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    navigationToVerseEditPage(context, verse);
                  }),
            ],
          ),
          VerseCard(
            item: verse,
            verse: verse,
            navigationToReadPage: null,
            addToFavorite: null,
          )
        ],
      ),
    );
  }

  void navigationToVerseEditPage(BuildContext context, Verse verse) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return VerseEdit(verse: verse);
    }));
  }
}
