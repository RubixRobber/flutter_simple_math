import 'package:flutter/material.dart';
import 'package:simplemath/app_colors.dart';
import 'package:simplemath/my_fonts.dart';
import 'package:simplemath/practice_type.dart';

class PracticePage extends StatefulWidget {
  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {

  Map eqData;
  int inputAns = 0;
  PracticeType type;
  int num1;
  int num2;
  int correct = 0;
  int qAns = 0;
  bool wait = false;
  bool go = true;


  Widget numButton(num){
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height/7,
        width: MediaQuery.of(context).size.width/3 - 4,
        margin: EdgeInsets.all(2.0),
        child: FlatButton(
          onPressed: () {
            if(!wait && inputAns < 1000000){
              inputAns = 10*inputAns + num;
              setState(() {

              });
            }

          }, //revisit this later
          color: AppColors.color2,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text(
            '$num',
            style: TextStyle(
              color: AppColors.color3,
              fontSize: 45.0,
              fontFamily: MyFonts.font1,
            ),
          ),
        ),
      ),
    );
  }

  void sleep(Duration duration) {
    var ms = duration.inMilliseconds;
    var start = new DateTime.now().millisecondsSinceEpoch;
    while (true) {
      var current = new DateTime.now().millisecondsSinceEpoch;
      if (current - start >= ms) {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    type = ModalRoute.of(context).settings.arguments;
    num1 = type.firstNum;
    num2 = type.secondNum;

    /*if(!(inputAns == type.ans && !wait)){
      if (wait){
        print("waiting...");
        sleep(Duration(seconds: 2));
        wait = false;
        go = false;
      } else{
        inputAns = type.ans;
        wait = true;
        go = false;//should be true
        qAns++;
      }

      setState(() {

      });
    }*/


    return Scaffold(
      backgroundColor: AppColors.color1,
      appBar: AppBar(
        backgroundColor: AppColors.color2,
        title: Text(type.name + '      ' + '$correct' + '/' + '$qAns', style: TextStyle(fontFamily: MyFonts.font1, color: AppColors.color3),),///put name
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: Text(
                num1.toString() + ' ' + type.symbol + ' ' + num2.toString() + ' = ' + (inputAns == 0? '': inputAns.toString()),
                style: TextStyle(
                  fontSize: 45.0,
                  fontFamily: MyFonts.font1,
                  color: wait ? AppColors.wrong: AppColors.color3
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      numButton(1),
                      numButton(2),
                      numButton(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      numButton(4),
                      numButton(5),
                      numButton(6),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      numButton(7),
                      numButton(8),
                      numButton(9),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height/7,
                          width: MediaQuery.of(context).size.width/3 - 4,
                          margin: EdgeInsets.all(2.0),
                          child: FlatButton(
                            onPressed: () {
                              if(!wait){
                                inputAns = ((inputAns - (inputAns % 10))/10).round();
                                setState(() {

                                });
                              }

                            }, //revisit this later
                            onLongPress: () {
                              if(!wait){
                                inputAns = 0;
                                setState(() {

                                });
                              }

                            },
                            color: AppColors.color2,
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
                            child: Icon(Icons.backspace, color: AppColors.color3, size: 40.0),
                          ),
                        ),
                      ),
                      numButton(0),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height/7,
                          width: MediaQuery.of(context).size.width/3 - 4,
                          margin: EdgeInsets.all(2.0),
                          child: FlatButton(
                            onPressed: () {
                              go = true;
                              while(go){
                                if(inputAns == type.ans && !wait){
                                  correct++;
                                  qAns++;

                                  type.MakeEquation();
                                  setState(() {
                                    num1 = type.firstNum;
                                    num2 = type.secondNum;
                                  });
                                  inputAns = 0;
                                  go = false;

                                  setState(() {

                                  });
                                } else {

                                  print("hi");
                                  if (wait){
                                    //sleep(Duration(seconds: 2));
                                    type.MakeEquation();
                                    setState(() {
                                      num1 = type.firstNum;
                                      num2 = type.secondNum;
                                    });
                                    inputAns = 0;
                                    wait = false;
                                    go = false;
                                    setState(() {

                                    });
                                  } else{
                                    inputAns = type.ans;
                                    wait = true;
                                    go = false;//should be true
                                    qAns++;
                                    setState(() {

                                    });
                                  }

                                  setState(() {

                                  });
                                }

                              }

                            }, //revisit this later
                            color: AppColors.color2,
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 27.0),
                            child: Icon(Icons.arrow_forward, color: AppColors.color3, size: 50.0),/*Text(
                              '->',
                              style: TextStyle(
                                color: AppColors.color3,
                                fontSize: 50.0,
                                fontFamily: MyFonts.font1,
                              ),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }

}
