import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mob_prog_project/data/plan/plan.dart';
import 'package:mob_prog_project/data/verse/verse.dart';

class PlanDatabaseService {
  final CollectionReference verseCollection =
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

  Future getPlanQuery(String query) async {
    QuerySnapshot qn = await verseCollection.getDocuments();
    List<Plan> planList = [];
    // print(qn.documents.length);
    qn.documents.forEach((element) {
      planList.add(Plan(
          title: element.data['title'],
          image: element.data['image'],
          verse: element.data['verse'],
          text: element.data['text'],
          author: element.data['author'],
          type: element.data['type'],
          id: element.documentID));
    });

    List<Plan> queryList =
        planList.where((element) => element.title.contains(query)).toList();

    return queryList;
  }

  Future getPlan() async {
    QuerySnapshot qn = await verseCollection.getDocuments();
    List<Plan> planList = [];
    // print(qn.documents.length);
    qn.documents.forEach((element) {
      planList.add(Plan(
          title: element.data['title'],
          image: element.data['image'],
          verse: element.data['verse'],
          text: element.data['text'],
          author: element.data['author'],
          type: element.data['type'],
          id: element.documentID));
    });

    // print(verseList);
    return planList;
  }
}
