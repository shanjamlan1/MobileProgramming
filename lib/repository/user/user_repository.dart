import 'package:mob_prog_project/data/user/user_database.dart';

class UserRepository {
  Future updateUserData(String uid, String name, bool status, DateTime date) =>
      UserDatabaseService().updateUserData(uid, name, status, date);

  Future getUsers() => UserDatabaseService().getUsers();
}
