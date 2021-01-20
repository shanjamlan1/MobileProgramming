import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_prog_project/data/plan/plan.dart';
import 'package:mob_prog_project/data/verse/verse.dart';
import 'package:mob_prog_project/presentation/bloc/verse/verse_bloc.dart';
import 'package:mob_prog_project/presentation/ui/plan_card/planview.dart';
import 'package:mob_prog_project/presentation/ui/verse/versecard.dart';
import 'package:mob_prog_project/repository/verse/verse_repository.dart';

class VerseEdit extends StatelessWidget {
  final Verse verse;

  const VerseEdit({Key key, this.verse}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerseBloc(VerseRepository()),
      child: MyVerseEditPageState(
        verse: verse,
      ),
    );
  }
}

class MyVerseEditPageState extends StatefulWidget {
  final Verse verse;

  const MyVerseEditPageState({Key key, this.verse}) : super(key: key);

  _MyVerseEditPageState createState() =>
      _MyVerseEditPageState(verse: this.verse);
}

class _MyVerseEditPageState extends State<MyVerseEditPageState> {
  final Verse verse;
  VerseRepository _verseRepository;
  VerseBloc verseBloc;

  _MyVerseEditPageState({this.verse});
  @override
  Widget build(BuildContext context) {
    verseBloc = BlocProvider.of<VerseBloc>(context);
    TextEditingController sentenceController = TextEditingController();
    TextEditingController authorController = TextEditingController();
    print(verse);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff3248),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                editVerse(
                    sentenceController, authorController, verse.id, context);
              })
        ],
      ),
      body: BlocListener<VerseBloc, VerseState>(
        listener: (context, state) {
          if (state is VerseFailureState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is VerseSuccessState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<VerseBloc, VerseState>(
          builder: (context, state) {
            if (state is VerseInitialState) {
              return buildInitialUi(
                  context, sentenceController, authorController, verse.id);
            } else if (state is VerseLoadingState) {
              return buildLoadingUI();
            } else if (state is VerseSuccessState) {
              return buildInitialUi(
                  context, sentenceController, authorController, verse.id);
            }

            return buildInitialUi(
                context, sentenceController, authorController, verse.id);
          },
        ),
      ),
    );
  }

  Widget buildLoadingUI() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildInitialUi(
      BuildContext context,
      TextEditingController sentenceController,
      TextEditingController authorController,
      String uid) {
    return Column(
      children: <Widget>[
        TextFormField(
            controller: sentenceController..text = verse.sentence,
            decoration: InputDecoration(
              icon: Icon(
                Icons.note,
                color: Color(0xff42b883),
              ),
              hintText: "Enter Sentence",
            ),
            style: TextStyle(color: Color(0xff42b883))),
        TextFormField(
            controller: authorController..text = verse.author,
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color(0xff42b883),
              ),
              hintText: "Enter Author",
            ),
            style: TextStyle(color: Color(0xff42b883)))
      ],
    );
  }

  void editVerse(
    TextEditingController sentenceController,
    TextEditingController authorController,
    String uid,
    BuildContext context,
  ) {
    verseBloc
        .add(EditVerse(sentenceController.text, authorController.text, uid));
  }
}
