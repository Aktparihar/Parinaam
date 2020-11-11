import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _sgpaController = TextEditingController();
  String grade = "";
  double _result;
  Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          centerTitle: true,
          title: Text(
            "Parinam",
            style: TextStyle(
              letterSpacing: 2,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 800,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/download.jpg"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Calculate your percentage",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: TextField(
                    controller: _sgpaController,
                    maxLength: 4,
                    decoration: new InputDecoration(
                      labelText: "Enter your SGPA",
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    // Only numbers can be entered
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(15),
                  color: Colors.red[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    side: BorderSide(color: Colors.red[800]),
                  ),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  onPressed: calculateSGPA,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  _result == null
                      ? "Please Enter SGPA"
                      : "Result - ${_result.toStringAsFixed(2)}%",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$grade",
                  style: TextStyle(
                    fontSize: 25,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateSGPA() {
    double sgpa = double.parse(_sgpaController.text);

    double result = (sgpa * 10) - 7.5;
    _result = result;
    if (result >= 90) {
      grade = "Excellent - Tera alag level hai!!!";
      color = Colors.greenAccent[700];
    } else if (result >= 80 && result < 90) {
      grade = "Very Good - Ittu sa bach gya!!!";
      color = Colors.greenAccent[400];
    } else if (result >= 70 && result < 80) {
      grade = "Good - Lage raho bhaiya ji!!!";
      color = Colors.yellow[600];
    } else if (result >= 60 && result < 70) {
      grade = "Average - Bhed chal !!!";
      color = Colors.orange[400];
    } else if (result >= 50 && result < 60) {
      grade = "Fair - Moka hai sudharja!!!";
      color = Colors.deepOrange[800];
    } else if (result >= 40 && result < 50) {
      grade = "Poor";
      color = Colors.red[700];
    } else if (result < 40) {
      grade = "Gedi mat mar padh le!!!";
      color = Colors.red;
    }
    setState(() {});
  }
}
