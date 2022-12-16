import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  String equation = '0';
  String expression = '';
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  myButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation = '0';
        result = '0';
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == '⌫') {
        // equation = equation - buttonText; this is not how we remove one character string//
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
          equationFontSize = 48.0;
          resultFontSize = 38.0;
        }
        //means start from positon 0 and remove the first number there which is length - 1
      } else if (buttonText == '=') {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser parser = Parser();
          Expression exp = parser.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == '0') {
          equation = buttonText;
        } else
          equation = equation + buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 30, bottom: 0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                equation,
                style: TextStyle(fontSize: equationFontSize),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 20, bottom: 0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                result,
                style: TextStyle(fontSize: resultFontSize),
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        reusable_button(
                          buttonColor: Colors.redAccent,
                          buttonHeight: 1,
                          buttonText: 'C',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.blue,
                          buttonHeight: 1,
                          buttonText: '⌫',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.blue,
                          buttonHeight: 1,
                          buttonText: '÷',
                          buttonPressed: myButtonPressed,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '9',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '8',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '7',
                          buttonPressed: myButtonPressed,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '6',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '5',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '4',
                          buttonPressed: myButtonPressed,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '3',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '2',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '1',
                          buttonPressed: myButtonPressed,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '.',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '0',
                          buttonPressed: myButtonPressed,
                        ),
                        reusable_button(
                          buttonColor: Colors.black54,
                          buttonHeight: 1,
                          buttonText: '00',
                          buttonPressed: myButtonPressed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      reusable_button(
                        buttonColor: Colors.blue,
                        buttonHeight: 1,
                        buttonText: '×',
                        buttonPressed: myButtonPressed,
                      ),
                    ]),
                    TableRow(children: [
                      reusable_button(
                        buttonColor: Colors.blue,
                        buttonHeight: 1,
                        buttonText: '-',
                        buttonPressed: myButtonPressed,
                      ),
                    ]),
                    TableRow(children: [
                      reusable_button(
                        buttonColor: Colors.blue,
                        buttonHeight: 1,
                        buttonText: '+',
                        buttonPressed: myButtonPressed,
                      ),
                    ]),
                    TableRow(children: [
                      reusable_button(
                        buttonColor: Colors.redAccent,
                        buttonHeight: 2,
                        buttonText: '=',
                        buttonPressed: myButtonPressed,
                      ),
                    ])
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

class reusable_button extends StatelessWidget {
  reusable_button({
    required this.buttonColor,
    required this.buttonHeight,
    required this.buttonText,
    this.buttonPressed,
  });
  final Color buttonColor;
  final double buttonHeight;
  final String buttonText;
  final Function(String)? buttonPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        onPressed:
            //this means is buttonPressed a null, if no assign it buttonPressed!(buttonText)else give it a null
            buttonPressed != null ? () => buttonPressed!(buttonText) : null,
        //  because you said it's nullable at the declaration part, make sure it's notnullable before you assign it that value.not buttonPressed()calls just what's in the return, but buttonPressed calls
        //the whole function
        //onPressed- returns a method
        //onPressed()- returns the return value of a method
      ),
    );
  }
}
