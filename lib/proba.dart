import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moj_majstor/Authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Majsor.dart';
import 'homeHeaderDelegate.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: HomeHeaderDelegate(openHeight: 100),
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                for (int i = 0; i < 100; i++)
                  Majstor(
                    slika: 'assets/img/radnik.jpg',
                    ime: 'aaa',
                    ocena: '10',
                  ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
