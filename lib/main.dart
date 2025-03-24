import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String InputValue = "";
  String ClacValue = "";
  String Oprator = "";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                InputValue,
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    clacButton("7", Colors.white54),
                    clacButton("8", Colors.white54),
                    clacButton("9", Colors.white54),
                    clacButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    clacButton("4", Colors.white54),
                    clacButton("5", Colors.white54),
                    clacButton("6", Colors.white54),
                    clacButton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    clacButton("1", Colors.white54),
                    clacButton("2", Colors.white54),
                    clacButton("3", Colors.white54),
                    clacButton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    clacButton("0", Colors.white54),
                    clacButton(".", Colors.white54),
                    clacButton("=", Colors.orange),
                    clacButton("+", Colors.orange),
                  ],
                ),
              ],
            ),
            clacButton("Clear", Colors.black),
          ],
        ),
      ),
    );
  }

  Widget clacButton(String text, Color bgColor) {
    return InkWell(
      onTap: () {
        if (text == "Clear") {
          setState(() {
            InputValue = "";
            ClacValue="";
            Oprator="";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            ClacValue = InputValue;
            InputValue = "";
            Oprator = text;
          });
        } else if (text == "=") {
          setState(() {
            double input = double.parse(InputValue);
            double Clac = double.parse(ClacValue);
            if(Oprator=="+"){
              InputValue =(input+Clac).toString();
            }else if(Oprator=="-"){
              InputValue=(input-Clac).toString();
            }else if(Oprator=="*"){
              InputValue=(input*Clac).toString();
            }
            else if(Oprator=="/"){
              InputValue=(input/Clac).toString();
            }
          });
        } else {
          setState(() {
            InputValue = InputValue + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        height: size,
        width: size,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
