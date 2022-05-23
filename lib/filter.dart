import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter extends GetxController {
  var category = ''.obs;
  var categoryIcon = ''.obs;
  var sortBy = 'Popularnost'.obs;
  String? city;
  final searchcontroller = TextEditingController();
  void handleSortByChange(String? value) {
    sortBy(value.toString());
  }
}
