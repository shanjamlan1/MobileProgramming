import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final CollectionReference userCollection =
      Firestore.instance.collection('user');

  Future updateUserData(
      String uid, String name, bool status, DateTime date) async {
    return await userCollection.document(uid).setData({
      "name": name,
      "status": status,
      "createdon": date,
      "updatedon": DateTime.now()
    });
  }

  Future getUsers() async {
    return await userCollection.getDocuments();
  }
}
