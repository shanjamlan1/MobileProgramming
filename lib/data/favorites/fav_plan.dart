import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mob_prog_project/data/plan/plan.dart';
import 'package:mob_prog_project/data/verse/verse.dart';

class FavPlanDatabaseService {
  final CollectionReference favoritePlanCollection =
      Firestore.instance.collection('favorite_plan');
  final CollectionReference planCollection =
      Firestore.instance.collection('plan');

  // Future updateUserData(
  //     String uid, String name, bool status, DateTime date) async {
  //   return await userCollection.document(uid).setData({
  //     "name": name,
  //     "status": status,
  //     "createdon": date,
  //     "updatedon": DateTime.now()
  //   });
  // }

  Future addToFavoritesPlan(Plan plan, String uid) async {
    // print(uid);
    var a = await favoritePlanCollection
        .where('user_id', isEqualTo: uid)
        .where('plan_id', isEqualTo: plan.id)
        .getDocuments();

    print(a.documents.length);
    if (a.documents.length != 0) {
      return a;
    }
    if (a.documents.length == 0) {
      await favoritePlanCollection.add({"user_id": uid, "plan_id": plan.id});
      return null;
    }
  }

  Future removeToFavoritePlan(String uid) async {
    print("remove : " + uid);
    await favoritePlanCollection.document(uid).delete();
  }

  Future getPlan(String uid) async {
    QuerySnapshot qn = await planCollection.getDocuments();
    QuerySnapshot favoriteqn = await favoritePlanCollection.getDocuments();
    List<Plan> planFavoriteList = [];
    qn.documents.forEach((element) {
      favoriteqn.documents.forEach((e) {
        if (e.data['user_id'] == uid &&
            e.data['plan_id'] == element.documentID) {
          planFavoriteList.add(Plan(
              title: element.data['title'],
              image: element.data['image'],
              verse: element.data['verse'],
              text: element.data['text'],
              author: element.data['author'],
              type: element.data['type'],
              id: element.documentID,
              favid: e.documentID));
        }
      });
    });
    print('fav_plan' + planFavoriteList.length.toString());
    // print(verseList);
    return planFavoriteList;
  }
}
