import 'package:mob_prog_project/data/verse/verse_database.dart';

class VerseRepository {
  Future getVerse() => UserDatabaseService().getVerse();
  Future updateVerseData(String uid, String sentence, String author) =>
      UserDatabaseService().updateVerseData(uid, sentence, author);
}
