import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserAuthentication with ChangeNotifier {
  static final UserAuthentication _singleton = UserAuthentication._internal();
  factory UserAuthentication() {
    return _singleton;
  }

  UserAuthentication._internal() {
    _initializeFirebase();
  }
  getImage() {
    if (_auth.currentUser?.photoURL != null) {
      return _auth.currentUser!.photoURL;
    }
    return '';
  }

  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  //UserCredential? userCredential;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  GoogleSignInAccount? _currentUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      //'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> Kategorije() async {
    print('eee');
    final kategorije = await firestore.collection('Kategorije').get();
    for (var k in kategorije.docs) {
      print(k.data());
    }
  }

  Future<void> signout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    notifyListeners();
  }

  Future<void> signInwithFacebook() async {
    final pom = await FacebookAuth.instance.login();
  }

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential uc = await _auth.signInWithCredential(credential);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return 'Gresaka, pokusajte ponovo!';
    }
  }

  Future<void> Login({required String email, required String password}) async {
    UserCredential uc = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    //  _auth.sendPasswordResetEmail(email: 'sgssasa@gmail.com')
  }

  Future<void> SignUp(
      {required String email,
      required String password,
      required String fullName,
      required String profilePhoto}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _addUser(
            uid: userCredential.user!.uid,
            fullName: fullName,
            profilePhoto: profilePhoto);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  Future<void>? _addUser(
      {required String uid,
      required String fullName,
      required String profilePhoto}) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({'UID': uid, 'fullName': fullName, 'profilePhoto': profilePhoto})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
