// ignore_for_file: prefer_const_constructors
//Simple Calculator
//Based off tutorial from https://www.youtube.com/watch?v=eVG5DkPF5x8
//But added my own modifications, such as using switch and cases rather than if else statements

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

///////////////////////////////////////////////////////////////////////////
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

/////////////////////////////////////////////////////////////////
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//////////////////////////////////////////////////////////////////
class _MyHomePageState extends State<MyHomePage> {
  
  String output = '0';
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  /////////////////////////////////////////////////////
  buttonPressed(String buttonText) {

    stateChange() {
      setState(() {
        output = double.parse(_output).toStringAsFixed(2);
      });
    }

    switch (buttonText) {
      case 'CLEAR':
        _output = '0';
        num1 = 0.0;
        num2 = 0.0;
        operand = '';
        stateChange();
        return;

      case '+':
      case '/':
      case '-':
      case 'X':
        num1 = double.parse(output);
        operand = buttonText;
        _output = '0';
        return;
      case '.':
        if (_output.contains('.')) {
          print('Already contains a decimal');
          return;
        } else {
          _output = _output + buttonText;
        }
        return;
      case '=':
        num2 = double.parse(output);
        switch (operand) {
          case '+':
            _output = (num1 + num2).toString();
            stateChange();
            break;
          case '-':
            _output = (num1 - num2).toString();
            stateChange();
            break;
          case '/':
            _output = (num1 / num2).toString();
            stateChange();
            break;
          case 'X':
            _output = (num1 * num2).toString();
            stateChange();
            break;
        }
        num1 = 0;
        num2 = 0;
        operand = '';

        return;
      default:
        _output = _output + buttonText;

        setState(() {
          output = double.parse(_output).toStringAsFixed(2);
        });
    } //End of case statements
  }

  ///////////////////////////////////////////////////
  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
         // maximumSize: Size(200, 101),
          padding: EdgeInsets.all(24),
          backgroundColor: Color(0xFF6B3E26),
          side: BorderSide(
            width: 2,
            
            color: Color(0xFFFFC6D9),
          ),
          shape: StadiumBorder(),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFDF5C9),
          ),
        ),
      ),
    );
  }

////////////////////////////////////////////////////
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator (Maryam)'),
        backgroundColor: Color(0xFF6B3E26),
      ),
      body: Container(
        color: Color(0xFFC2F2D0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                //allows padding horizontally and vertically
                vertical: 20.0,
                horizontal: 12.0,
              ),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.black,
                thickness: 0,
              ), //contains a divider that will take up all of the vertical space
            ), 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //having this here means the button takes up the space horizontally instead of vertically
                  children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //having this here means the button takes up the space horizontally instead of vertically
                  children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('X'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //having this here means the button takes up the space horizontally instead of vertically
                  children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //having this here means the button takes up the space horizontally instead of vertically
                  children: [
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //having this here means the button takes up the space horizontally instead of vertically
                  children: [
                    buildButton('CLEAR'),
                    buildButton('='),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
