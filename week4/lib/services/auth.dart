import 'package:firebase_auth/firebase_auth.dart';
import 'package:week4/pages/authen/user.dart';

class AuthenService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Person? _userFromFirebase(User user){
    return user != null ? Person(uid: user.uid):null;
  }

  Stream<Person?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  // sign in with email & password

  Future signinWithEmail(String email, String password) async{
    try{
  UserCredential result = await _auth.signInWithEmailAndPassword(email:email, password: password);
  User? user = result.user;
  return _userFromFirebase(user!);
  }catch(e){
      print(e.toString());
      return null;
    }
}


  //register with email & password
  Future registerWithEmail(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email:email, password: password);
      User? user = result.user;
      return _userFromFirebase(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}

}