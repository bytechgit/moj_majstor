import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserAuthentication with ChangeNotifier {
  static final UserAuthentication _singleton = UserAuthentication._internal();
  factory UserAuthentication() {
    return _singleton;
  }

  UserAuthentication._internal() {
    _initializeFirebase();
  }
  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/firebase.messaging',
      'https://www.googleapis.com/auth/firebase',
      //'firebasenotifications.messages.create'
    ],
  );
  User? get currentUser {
    return _auth.currentUser;
  }

  Future<void> signout() async {
    await _googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
    notifyListeners();
  }

  Future<String> signInwithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: const ['public_profile']);
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =
              await _auth.signInWithCredential(facebookCredential);
          if (_auth.currentUser?.emailVerified == false) {
            _auth.currentUser?.sendEmailVerification();
          }
          print(_auth.currentUser);
          return 'Uspesna prijava'; //Resource(status: Status.Success);
        case LoginStatus.cancelled:
          return 'Prijava otkazana'; //Resource(status: Status.Cancelled);
        case LoginStatus.failed:
          return 'Neuspela prijava'; //Resource(status: Status.Error);
        default:
          return 'Greska';
      }
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Greska, pokusajte ponovo';
    }
  }

  Future<String> signInwithGoogle() async {
    this.signout();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final googleAuth = await googleSignInAccount.authentication;
        googleAuth.accessToken;
        UserCredential uc = await _auth.signInWithCredential(credential);
        notifyListeners();
        final user = await _auth.currentUser;
        final idToken = await user?.getIdToken();
        print("token");
        print(googleAuth.accessToken);
        return 'Uspesno ste prijavljeni!';
      }

      return 'Greska, pokusajte ponovo';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Greska';
    } on Exception catch (e) {
      return 'Gresaka, pokusajte ponovo!';
    }
  }

  Future<String> Login(
      {required String email, required String password}) async {
    try {
      UserCredential uc = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Uspesno ste prijavljeni';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Greska, pokusajte ponovo';
    } catch (e) {
      return 'Greska, pokusajte ponovo';
    }
  }

  Future<String> signUp({
    required String email,
    required String password,
    required String fullName,
    required String city,
    required String streetAddress,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        userCredential.user!.sendEmailVerification();
        _addUser(
            uid: userCredential.user!.uid,
            fullName: fullName,
            city: city,
            streetAddress: streetAddress);
      }
      return 'Na vasu email adresu je poslat link za vrerifikaciju';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Greska, pokusajte ponovo';
    } catch (e) {
      return 'Greska, pokusajte ponovo';
    }
  }

  Future<void>? _addUser({
    required String uid,
    required String fullName,
    required String city,
    required String streetAddress,
  }) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'UID': uid,
          'fullName': fullName,
          'city': city,
          'streetAddress': streetAddress
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
