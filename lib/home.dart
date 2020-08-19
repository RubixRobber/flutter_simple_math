import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplemath/app_colors.dart';
import 'package:simplemath/my_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.color1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20,),
          Center(
            child: Text(
              'Math Trainer',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.color3, fontSize: 60.0, fontFamily: MyFonts.font1),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage(
                    'assets/templogo_math.png',

                    //'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Basic_arithmetic_operators.svg/1200px-Basic_arithmetic_operators.svg.png',
                    //fit: BoxFit.fill,//issue
                ),
                width: ((MediaQuery.of(context).size.width)/1.6),//((MediaQuery.of(context).size.width)/2.5)
                height: ((MediaQuery.of(context).size.width)/1.6),
              ),
          ),
          /*Text(
            '+-',
            style: TextStyle(
              fontSize: 200,
              fontFamily: MyFonts.font1,
              color: AppColors.color3
            ),
          ),
          Text(
            'x/',
            style: TextStyle(
                fontSize: 200,
                fontFamily: MyFonts.font1,
                color: AppColors.color3
            ),
          ),*/
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/choose_exercise');
              }, //revisit this later
              color: AppColors.color2,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),

              child: Text(
                'practice',
                style: TextStyle(color: AppColors.color3, fontSize: 40.0, fontFamily: MyFonts.font1),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
