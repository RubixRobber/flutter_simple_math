import 'package:flutter/material.dart';
import 'package:simplemath/my_fonts.dart';
import 'package:simplemath/practice_type.dart';
import 'package:simplemath/home.dart';
import 'package:simplemath/app_colors.dart';
import 'package:simplemath/settings_class.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  RangeValues firstNumValues = RangeValues(1, 10);
  RangeValues secondNumValues = RangeValues(1, 10);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1,
      appBar: AppBar(
        backgroundColor: AppColors.color2,
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: MyFonts.font1,
            color: AppColors.color3,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            color: AppColors.color2,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'first number range',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.color3,
                      fontSize: 35.0,
                      fontFamily: MyFonts.font1,
                    ),
                  ),
                ),
                Container(
                  color: AppColors.color4,
                  margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                  child: RangeSlider(
                    min:1,
                    max:30,
                    divisions: 29,
                    values: firstNumValues,
                    onChanged: (value) {
                      setState(() {
                        firstNumValues = value;
                      });
                    },
                    labels: RangeLabels('${firstNumValues.start}','${firstNumValues.end}'),

                  ),
                ),
              ],
            ),
          ),

          //SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            color: AppColors.color2,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'second number range',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.color3,
                      fontSize: 35.0,
                      fontFamily: MyFonts.font1,
                    ),
                  ),
                ),
                Container(
                  color: AppColors.color4,
                  margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                  child: RangeSlider(
                    min:1,
                    max:30,
                    divisions: 29,
                    values: secondNumValues,
                    onChanged: (value) {
                      setState(() {
                        secondNumValues = value;
                      });
                    },
                    labels: RangeLabels('${secondNumValues.start}','${secondNumValues.end}'),

                  ),
                ),
              ],
            ),
          ),

          //SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: () {
                SettingsClass.setFirstNumRange([firstNumValues.start.round(), firstNumValues.end.round()]);
                SettingsClass.setSecondNumRange([secondNumValues.start.round(), secondNumValues.end.round()]);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(context, '/choose_exercise');//, arguments: {'FirstNumValues' :firstNumValues, 'SecondNumValues' :secondNumValues}
              }, //revisit this later
              color: AppColors.color2,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),

              child: Text(
                'confirm',
                style: TextStyle(color: AppColors.color3, fontSize: 40.0, fontFamily: MyFonts.font1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
