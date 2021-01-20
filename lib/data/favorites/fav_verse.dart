import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mob_prog_project/data/plan/plan.dart';
import 'package:mob_prog_project/data/verse/verse.dart';

class FavVerseDatabaseService {
  final CollectionReference favoriteVerseCollection =
      Firestore.instance.collection('favorite_verse');
  final CollectionReference verseCollection =
      Firestore.instance.collection('verse');

  // Future updateUserData(
  //     String uid, String name, bool status, DateTime date) async {
  //   return await userCollection.document(uid).setData({
  //     "name": name,
  //     "status": status,
  //     "createdon": date,
  //     "updatedon": DateTime.now()
  //   });
  // }

  Future addToFavorites(Verse verse, String uid) async {
    // print(uid);
    var a = await favoriteVerseCollection
        .where('user_id', isEqualTo: uid)
        .where('verse_id', isEqualTo: verse.id)
        .getDocuments();

    print(a.documents.length);
    if (a.documents.length != 0) {
      return a;
    }
    if (a.documents.length == 0) {
      await favoriteVerseCollection.add({"user_id": uid, "verse_id": verse.id});
      return null;
    }
  }

  Future removeToFavorite(String uid) async {
    print("remove : " + uid);
    await favoriteVerseCollection.document(uid).delete();
  }

  Future getVerse(String uid) async {
    QuerySnapshot qn = await verseCollection.getDocuments();
    QuerySnapshot favoriteqn = await favoriteVerseCollection.getDocuments();
    List<Verse> verseFavoriteList = [];
    print(qn.documents.length);
    qn.documents.forEach((element) {
      favoriteqn.documents.forEach((e) {
        if (e.data['user_id'] == uid &&
            e.data['verse_id'] == element.documentID) {
          print(element.documentID);
          verseFavoriteList.add(Verse(
              sentence: element.data['sentence'],
              author: element.data['author'],
              id: element.documentID,
              favid: e.documentID));
        }
      });
    });

    // print(verseList);
    return verseFavoriteList;
  }
}
