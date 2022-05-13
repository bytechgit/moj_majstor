import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moj_majstor/models/Majstor.dart';

class AppState with ChangeNotifier {
  AppState() {}
  final _firestore = FirebaseFirestore.instance;
  List<Majstor> majstori = [];
  DocumentSnapshot<Object?>? lastReadedDoc;
  Future<int> ProcitajMajstori() async {
    if (lastReadedDoc == null) {
      final newDocumentList = (await _firestore
          .collection("Users")
          // .orderBy("score")
          .limit(2)
          .get());
      for (var document in newDocumentList.docs) {
        majstori.add(Majstor.fromMap(document.data()));
      }
      lastReadedDoc = newDocumentList.docs.last;
      notifyListeners();
      return newDocumentList.docs.length;
    } else {
      final newDocumentList = (await _firestore
          .collection("Users")
          // .orderBy("score")
          .startAfterDocument(lastReadedDoc!)
          .limit(2)
          .get());
      for (var document in newDocumentList.docs) {
        majstori.add(Majstor.fromMap(document.data()));
      }
      if (newDocumentList.docs.isNotEmpty) {
        lastReadedDoc = newDocumentList.docs.last;
      }
      notifyListeners();
      return newDocumentList.docs.length;
    }
  }
}
