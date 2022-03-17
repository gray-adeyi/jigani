import 'package:jigani/constants/app_constants.dart';
import 'package:jigani/widgets/left_bar.dart';
import 'package:jigani/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 130,
                    child: Column(
                      children: [
                        TextField(
                          controller: _heightController,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: accentHexColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Height",
                              hintStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(.8))),
                        ),
                        Text(
                          "meters",
                          style: TextStyle(color: Colors.white.withOpacity(.8)),
                        )
                      ],
                    )),
                Container(
                    width: 130,
                    child: Column(
                      children: [
                        TextField(
                          controller: _weightController,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: accentHexColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Weight",
                              hintStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(.8))),
                        ),
                        Text(
                          "kilograms",
                          style: TextStyle(color: Colors.white.withOpacity(.8)),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h;
                double _w;

                if (_heightController.text == "") {
                  _h = 0.0;
                } else {
                  _h = double.parse(_heightController.text);
                }

                if (_weightController.text == "") {
                  _w = 0.0;
                } else {
                  _w = double.parse(_weightController.text);
                }

                setState(() {
                  _bmiResult = _w / (_h * _h);

                  if (_bmiResult > 25) {
                    _textResult = "You're over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "Your weight is normal";
                  } else if (_bmiResult.isNaN) {
                    _bmiResult = 0.0;
                    _textResult = "Error in calculations";
                  } else {
                    _textResult = "You're under weight!";
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: accentHexColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text("Calculate",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _heightController.text = "";
                  _weightController.text = "";
                  _bmiResult = 0.0;
                  _textResult = "";
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Text("Reset",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 50, color: accentHexColor)),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RightBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 10,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 10,
            ),
            RightBar(barWidth: 40),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 70),
            Container(
              child: Text("Built by Gbenga ©2022",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            )
          ],
        )));
  }
}
