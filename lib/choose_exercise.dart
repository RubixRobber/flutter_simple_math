import 'package:flutter/material.dart';
import 'package:simplemath/my_fonts.dart';
import 'package:simplemath/practice_type.dart';
import 'package:simplemath/home.dart';
import 'package:simplemath/app_colors.dart';
import 'package:simplemath/settings_class.dart';

class ChooseExercise extends StatefulWidget {
  @override
  _ChooseExerciseState createState() => _ChooseExerciseState();
}

class _ChooseExerciseState extends State<ChooseExercise> {

  List<PracticeType> practices = [
    PracticeType(firstNumBound: SettingsClass.firstNumRange , secondNumBound: SettingsClass.secondNumRange, name: 'addition'),
    PracticeType(firstNumBound: SettingsClass.firstNumRange, secondNumBound: SettingsClass.secondNumRange, name: 'subtraction'),
    PracticeType(firstNumBound: SettingsClass.firstNumRange, secondNumBound: SettingsClass.secondNumRange, name: 'multiplication'),
    PracticeType(firstNumBound: SettingsClass.firstNumRange, secondNumBound: SettingsClass.secondNumRange, name: 'division'),
  ];

  //Map ranges;


  void goToPractice(index) {
    PracticeType instance = practices[index];
    instance.MakeEquation();
    Navigator.pushNamed(context, '/practice_page' , arguments: instance /*{
      'firstNum': instance.firstNum,
      'secondNum':instance.secondNum,
      'name':instance.name,
      'ans':instance.ans,
      'symbol':instance.symbol,
    }*/);
  }

  @override
  Widget build(BuildContext context) {

    //ranges = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: AppColors.color1,
      appBar: AppBar(
        backgroundColor: AppColors.color2,
        title: Text(
            'Choose an Exercise',
          style: TextStyle(
            fontFamily: MyFonts.font1,
            color: AppColors.color3,
            fontSize: 15.0
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.settings, color: AppColors.color3,),
            highlightColor: AppColors.color3,
            onPressed: (){
              Navigator.pushNamed(context, '/settings_page');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: practices.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: FlatButton(
                  color: AppColors.color2,
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                  onPressed: () {
                    goToPractice(index);
                  },
                  child: Text(
                    practices[index].name,
                    style: TextStyle(
                      color: AppColors.color3,
                      fontSize: 40.0,
                      fontFamily: MyFonts.font1
                    ),
                  ),
              ),
            );
          },
        ),
      ),
    );
  }
}
