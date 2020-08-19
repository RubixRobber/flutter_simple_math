import 'package:flutter/material.dart';

class SettingsClass {
  static List<int> firstNumRange = [1, 10];
  static List<int> secondNumRange = [1, 10];

  static setFirstNumRange(newRange) {
    firstNumRange = newRange;
  }
  static setSecondNumRange(newRange) {
    secondNumRange = newRange;
  }

}