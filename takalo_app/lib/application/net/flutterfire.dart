import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;
  //FirebaseAuth instance
  AuthenticationProvider(this.firebaseAuth);
  Stream<User?> get authState => firebaseAuth.idTokenChanges();
}

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    return false;
  }
}

Future<bool> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == "weak-password") {
      if (kDebugMode) {
        print("The password provided is too weak");
      }
    } else if (e.code == "email-already-in-use") {
      if (kDebugMode) {
        print("The account already exist for that mail");
      }
    }
    return false;
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    return false;
  }
}

Future<bool> addCoin(String id, String amount) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var value = double.parse(amount);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Coins")
        .doc(id);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': value});
        return true;
      }
      // double newAmount = value + snapshot.data()!['Amount'];
      // transaction.update(documentReference, {"Amount": newAmount});
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeCoins(String id) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Coins')
        .doc(id);
    documentReference.delete();
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}
