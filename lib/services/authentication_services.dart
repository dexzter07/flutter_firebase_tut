import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//Registration with email and password
Future createNewUser(String email, String password) async {
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final User? user = FirebaseAuth.instance.currentUser;
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

//Sign Out
}