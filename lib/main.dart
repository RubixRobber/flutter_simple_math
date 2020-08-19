import 'package:flutter/material.dart';
import 'package:simplemath/choose_exercise.dart';
import 'package:simplemath/home.dart';
import 'package:simplemath/practice_page.dart';
import 'package:simplemath/app_colors.dart';
import 'package:simplemath/settings.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Home(),
      '/home': (context) => Home(),
      '/choose_exercise': (context) => ChooseExercise(),
      '/practice_page': (context) => PracticePage(),
      '/settings_page': (context) => Settings()
    },
  ));
}