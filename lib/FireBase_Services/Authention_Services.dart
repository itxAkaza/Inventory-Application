import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthentionServices {
  final auth = FirebaseAuth.instance;
  final firestoreref = FirebaseFirestore.instance.collection("User");

  //sign in

  Future<UserCredential> signinWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

    /*  firestoreref.doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
      });*/

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up

  Future<UserCredential> signUpWithEmailPassword(
      String email, String password, String User_Name) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      firestoreref.doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
        "username": User_Name
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Signout

  Future<void> SignOut() async {
    try {
      return await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
