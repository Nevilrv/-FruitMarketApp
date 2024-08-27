import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropController extends GetxController {
  var selectType = 'Organic Vegetables'.obs;
  dropSelect(value) {
    selectType.value = value;
  }
}
