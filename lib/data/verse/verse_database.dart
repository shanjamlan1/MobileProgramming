import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mob_prog_project/data/verse/verse.dart';

class UserDatabaseService {
  final CollectionReference verseCollection =
      Firestore.instance.collection('verse');

  Future updateVerseData(String uid, String sentence, String author) async {
    return await verseCollection.document(uid).setData({
      "sentence": sentence,
      "author": author,
    });
  }

  Future getVerse() async {
    QuerySnapshot qn = await verseCollection.getDocuments();
    List<Verse> verseList = [];
    // print(qn.documents.length);
    qn.documents.forEach((element) {
      print(element.documentID);
      verseList.add(Verse(
          sentence: element.data['sentence'],
          author: element.data['author'],
          id: element.documentID));
    });

    // print(verseList);
    return verseList;
  }
}
