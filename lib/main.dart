import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontSize = 38;
  double resultFontSize = 48;

  onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation = '0';
        result = '0';
        equationFontSize = 38;
        resultFontSize = 48;
      } else if (buttonText == '«') {
        equationFontSize = 48;
        resultFontSize = 38;
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (buttonText == '=') {
        equationFontSize = 38;
        resultFontSize = 48;
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser parser = Parser();
          Expression exp = parser.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
          print(e);
        }
      } else {
        equationFontSize = 48;
        resultFontSize = 38;
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buttonContainer({
    String buttonText,
    double buttonHeight,
    Color buttonColor,
  }) {
    return Container(
      margin: EdgeInsets.all(4),
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: FlatButton(
          color: buttonColor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(8),
          onPressed: () => onButtonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30,
                color:
                    buttonColor == Colors.white ? Colors.black : Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize, color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize, color: Colors.white),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: <Widget>[
                      buttonContainer(
                        buttonColor: Colors.white,
                        buttonHeight: 1,
                        buttonText: "C",
                      ),
                      buttonContainer(
                        buttonColor: Colors.purple[700],
                        buttonHeight: 1,
                        buttonText: '«',
                      ),
                      buttonContainer(
                          buttonColor: Colors.purple[700],
                          buttonHeight: 1,
                          buttonText: '÷'),
                    ]),
                    TableRow(children: <Widget>[
                      buttonContainer(
                        buttonColor: Colors.white12,
                        buttonHeight: 1,
                        buttonText: "7",
                      ),
                      buttonContainer(
                        buttonColor: Colors.white12,
                        buttonHeight: 1,
                        buttonText: '8',
                      ),
                      buttonContainer(
                          buttonColor: Colors.white12,
                          buttonHeight: 1,
                          buttonText: '9'),
                    ]),
                    TableRow(children: <Widget>[
                      buttonContainer(
                        buttonColor: Colors.white12,
                        buttonHeight: 1,
                        buttonText: "4",
                      ),
                      buttonContainer(
                        buttonColor: Colors.white12,
                        buttonHeight: 1,
                        buttonText: '5',
                      ),
                      buttonContainer(
                          buttonColor: Colors.white12,
                          buttonHeight: 1,
                          buttonText: '6'),
                    ]),
                    TableRow(children: <Widget>[
                      buttonContainer(
                        buttonColor: Colors.white12,
                        buttonHeight: 1,
                        buttonText: "1",
                      ),
                      buttonContainer(
                        buttonColor: Colors.white12,
                        buttonHeight: 1,
                        buttonText: '2',
                      ),
                      buttonContainer(
                          buttonColor: Colors.white12,
                          buttonHeight: 1,
                          buttonText: '3'),
                    ]),
                    TableRow(children: <Widget>[
                      buttonContainer(
                        buttonColor: Colors.white12,
                        buttonHeight: 1,
                        buttonText: ".",
                      ),
                      buttonContainer(
                        buttonColor: Colors.white12,
                        buttonHeight: 1,
                        buttonText: '0',
                      ),
                      buttonContainer(
                          buttonColor: Colors.white12,
                          buttonHeight: 1,
                          buttonText: '00'),
                    ])
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buttonContainer(
                          buttonColor: Colors.purple[700],
                          buttonHeight: 1,
                          buttonText: '×'),
                    ]),
                    TableRow(children: [
                      buttonContainer(
                          buttonColor: Colors.purple[700],
                          buttonHeight: 1,
                          buttonText: '-'),
                    ]),
                    TableRow(children: [
                      buttonContainer(
                          buttonColor: Colors.purple[700],
                          buttonHeight: 1,
                          buttonText: '+'),
                    ]),
                    TableRow(
                      children: [
                        Container(
                          margin: EdgeInsets.all(4),
                          height:
                              MediaQuery.of(context).size.height * 0.1 * 2.3,
                          child: FlatButton(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.all(8),
                              onPressed: () => onButtonPressed('='),
                              child: Text(
                                "=",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
