// --> Handles Firebase Auth & Firestore logic

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // --> 1. Sign Up User & Save Details to Firestore
  Future<String?> signUpUser({required String name, required String email, required String password}) async {
    try {
      // Create user in Firebase Authentication
      UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // Save user details in Firestore Database using their unique UID
      await _firestore.collection('users').doc(cred.user!.uid).set({'uid': cred.user!.uid, 'name': name, 'email': email});
      return "Success";
    } catch (e) {
      return e.toString(); // Return error message
    }
  }

  // --> 2. Log In Existing User
  Future<String?> loginUser({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  // --> 3. Log Out User
  Future<void> logOut() async {
    await _auth.signOut();
  }
}
