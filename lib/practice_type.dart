
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simplemath/app_colors.dart';

class PracticeType{
  List<int> firstNumBound;
  List<int> secondNumBound;
  String name;
  String symbol;
  int firstNum;
  int secondNum;
  int ans;
  int tempAns;


  PracticeType({this.firstNumBound, this.secondNumBound, this.name});

  MakeEquation() {
    Random rnd = Random();
    firstNum = firstNumBound[0] + rnd.nextInt(firstNumBound[1] - firstNumBound[0] + 1);
    secondNum = secondNumBound[0] + rnd.nextInt(secondNumBound[1] - secondNumBound[0] + 1);
    if(name == 'addition'){
      symbol = '+';
      ans = firstNum + secondNum;
    } else if(name == 'subtraction'){
      symbol = '-';
      tempAns = firstNum + secondNum;
      ans = firstNum;
      firstNum = tempAns;

    } else if(name == 'multiplication'){
      symbol = 'x';
      ans = firstNum * secondNum;
    } else if(name == 'division'){
      symbol = '÷';
      tempAns = firstNum * secondNum;
      ans = firstNum;
      firstNum = tempAns;
    }
  }
}