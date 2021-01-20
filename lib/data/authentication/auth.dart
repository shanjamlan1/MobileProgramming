import 'package:firebase_auth/firebase_auth.dart';
import 'package:mob_prog_project/repository/user/user_repository.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in With email and password
  Future signInUser(
    String email,
    String password,
  ) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // // Get All the User from the Database
      // QuerySnapshot querySnapshot = await UserRepository().getUsers();
      // querySnapshot.documents.forEach((document) {
      //   print(document.data);
      // });
      // var listUser = querySnapshot.documents;
      // print('-----------------------------');
      // listUser.forEach((element) {
      //   print(element.data);
      // });
      // print('-----------------------------');
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerUser(
    String email,
    String password,
    String username,
  ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // Create a new Document
      await UserRepository()
          .updateUserData(user.uid, username, true, DateTime.now());
      // // Get All the User from the Database
      // QuerySnapshot querySnapshot = await UserRepository().getUsers();
      // querySnapshot.documents.forEach((document) {
      //   print(document.data);
      // });

      return user;
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  // Sign out method
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future isSignIn() async {
    try {
      var currentUser = await _auth.currentUser();
      print(currentUser);
      return currentUser != null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    return await _auth.currentUser();
  }
}
