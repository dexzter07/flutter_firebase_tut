import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/database_manager/database_manager.dart';

class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//Registration with email and password
Future createNewUser(String name, String email, String password ) async {
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final User? user = FirebaseAuth.instance.currentUser;
    await DatabaseManager().createUserData(name, "Male", 100, user!.uid);
    return user;
  }catch(e){
    print(e.toString());
  }
}

//Sign In with email and Password
Future loginUser(String email, String password)async {
  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User? user = FirebaseAuth.instance.currentUser;
    return user;
  }catch(e){
    print(e.toString());
  }
}

// signout

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}