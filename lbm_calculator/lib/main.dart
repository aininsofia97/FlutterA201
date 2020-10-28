import 'package:flutter/material.dart';
import 'dart:math';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {            
  @override                 
  _MyAppState createState() => _MyAppState();       
}       

class _MyAppState extends State<MyApp> {          
  TextEditingController _heightctrl = new TextEditingController();  
  TextEditingController _weightctrl = new TextEditingController();                       
  int _radioValue1;
  int _radioValue2;
  double w = 0.0;
  double h = 0.0;
  double boer = 0.0;
  double boerFat = 0.0;
  double james = 0.0;
  double jamesFat = 0.0;
  double hume = 0.0;
  double humeFat = 0.0;
  double peterChildren = 0.0;
  double peterFat = 0.0;

   void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }
  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
        });
  }
  
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            home: Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                title: Text('Lean Body Mass Calculator (Metric Unit)', 
                style:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
              ),
              body: Center(
                child: SingleChildScrollView(
                child: Container(
                child: Card(
                  elevation: 0,
                  color: Colors.white70,
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Gender:",
                    style: new TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                  ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                            value: 1,
                            groupValue: _radioValue1,
                            onChanged: (value) {
                              _handleRadioValueChange1(value);
                            }),
                        Text(
                          'Male',
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Radio(
                            value: 2,
                            groupValue: _radioValue1,
                            onChanged: (value) {
                              _handleRadioValueChange1(value);
                            }),
                        Text(
                          'Female',
                          style: new TextStyle(fontSize: 15.0),
                        ),
                      ]),
                  Text(
                    "Age 14 or younger:",
                    style: new TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                  ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                            value: 3,
                            groupValue: _radioValue2,
                            onChanged: (value) {
                              _handleRadioValueChange2(value);
                            }),
                        Text(
                          'Yes',
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Radio(
                            value: 4,
                            groupValue: _radioValue2,
                            onChanged: (value) {
                              _handleRadioValueChange2(value);
                            }),
                        Text(
                          'No',
                          style: new TextStyle(fontSize: 15.0),
                        ),
                      ]),
                      Padding (
                        padding: EdgeInsets.fromLTRB(40, 2, 40, 2),
                        child: TextField(
                          controller: _heightctrl,
                          keyboardType: TextInputType.numberWithOptions(),
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.black),
                              hintText: "Height (cm)",
                              fillColor: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 2, 40, 2),
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                          controller: _weightctrl,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.black),
                              hintText: "Weight (kg)",
                              fillColor: Colors.white70),
                        ),
                      ),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          color: Colors.blue[200],
                          child: Text("Calculate"),
                          onPressed: _onPress,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                            color: Colors.blue[200],
                            child: Text("Clear"),
                            onPressed: () {
                              _heightctrl.clear();
                              _weightctrl.clear();
                              boer = 0.0;
                              james = 0.0;
                              hume = 0.0;
                              peterChildren = 0.0;
                              boerFat = 0.0;
                              jamesFat = 0.0;
                              humeFat = 0.0;
                              peterFat = 0.0;
                              setState(() {});
                            }),
                      ),
                    ],
                  ),
                   Container(
                padding: EdgeInsets.all(20),
                child: Table(
                    border: TableBorder.all(color: Colors.blue),
                    children: [
                      TableRow(children: [
                        Text('Formula'),
                        Text('Lean Body Mass'),
                        Text('Body Fat %'),
                      ]),
                       TableRow(children: [
                        Text('Peters (for Children)'),
                        Text(peterChildren.toStringAsFixed(2) + 'kg'),
                        Text(peterFat.toStringAsFixed(2) + 'kg'),
                      ]),
                      TableRow(children: [
                        Text('Boer'),
                        Text(boer.toStringAsFixed(2) + 'kg'),
                        Text(boerFat.toStringAsFixed(2) + 'kg'),
                      ]),
                      TableRow(children: [
                        Text('James'),
                        Text(james.toStringAsFixed(2) + 'kg'),
                        Text(jamesFat.toStringAsFixed(2) + 'kg'),
                      ]),
                      TableRow(children: [
                        Text('Hume'),
                        Text(hume.toStringAsFixed(2) + 'kg'),
                        Text(humeFat.toStringAsFixed(2) + 'kg'),
                      ]),
                    ]))
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
        
  }

  _onPress() {
    setState(() {
      h = double.parse(_heightctrl.text);
      w = double.parse(_weightctrl.text);
      if (_radioValue1 == 1) {
        boer = (0.407*w) + (0.267*h) - 19.2;
        james = (1.1*w) - (128*(w / h) * (w / h));
        hume = (0.32810*w) + (0.33929*h) - 29.5336;
      } else {
        boer = (0.252*w) + (0.473*h) - 48.3;
        james = (1.07*w) - (148 * (w / h) * (w / h));
        hume = (0.2956*w) + (0.41813*h) - 43.2933;
      }
      boerFat = 100 - ((boer / w) * 100);
      jamesFat = 100 - ((james / w) * 100);
      humeFat = 100 - ((hume / w) * 100);


      if (_radioValue2 == 3) {
        peterChildren = ((0.0215) * (pow(w, 0.6469)) * (pow(h, 0.7236))) * 3.8;
        peterFat = 100 - ((peterChildren / w) * 100);
        boer = 0.0;
        james = 0.0;
        hume = 0.0;
        boerFat = 0.0;
        jamesFat = 0.0;
        humeFat = 0.0;
      } else {
        peterFat = 0.0;
        peterChildren = 0.0;
      }
    });
  }
}