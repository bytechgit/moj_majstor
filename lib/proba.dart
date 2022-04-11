import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moj_majstor/Authentication.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*

Platform  Firebase App Id
android   1:206265439348:android:c4420e046c88e20e216d21
ios       1:206265439348:ios:1e9694a1a80e0064216d21

Learn more about using this file in the FlutterFire documentation:
 > https://firebase.flutter.dev/docs/cli

C:\Users\sgssa\AndroidStudioProjects\moj_majstor>

 */
class proba extends StatefulWidget {
  const proba({Key? key}) : super(key: key);

  @override
  State<proba> createState() => _probaState();
}

class _probaState extends State<proba> {
  final _auth = FirebaseAuth.instance;
  String email = "sgssasa@gmail.com";
  UserAuthentication ua = UserAuthentication();
  Future<void> fun() async {
    print("aaaaa");
    try {} on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print(e.message);
      }
    }
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  UserCredential? userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Firebase Authentication'),
        ),
        body: IconButton(
            onPressed: () async => {
                  ua.SignUp(
                      email: 'pr123@gmail.com',
                      password: '1233456',
                      fullName: 'Ime',
                      profilePhoto: 'slika')
                  //ua.handleSignIn(),
                },
            icon: Icon(Icons.login)));
  }
}
