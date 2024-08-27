import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _temp = '0';
  String _Operation = '';
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String text) {
    setState(() {
      if (text == 'C') {
        _output = '0';
        _temp = '0';
        _num1 = 0;
        _num2 = 0;
        _Operation = '';
      } else if (text == '+' || text == '-' || text == 'x' || text == ':') {
        _num1 = double.parse(_temp);
        _Operation = text;
        _temp = '0';
      } else if (text == '=') {
        _num2 = double.parse(_temp);

        switch (_Operation) {
          case '+':
            _output = (_num1 + _num2).toString();
            break;
          case '-':
            _output = (_num1 - _num2).toString();
            break;
          case 'x':
            _output = (_num1 * _num2).toString();
            break;
          case ':':
            _output = (_num1 / _num2).toString();
            break;
        }
        _temp = _output;
        _num1 = 0;
        _num2 = 0;
        _Operation = '';
      } else {
        _temp = _temp == '0' ? text : _temp + text;
        _output = _temp;
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20.0)),
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0),
      ),
      onPressed: () => _buttonPressed(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('x'),
                ],
              ),
              Row(
                children: [
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton(':'),
                ],
              ),
              Row(
                children: [
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('+'),
                ],
              ),
              Row(
                children: [
                  _buildButton('C'),
                  _buildButton('0'),
                  _buildButton('='),
                  _buildButton('-'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const Kalkulator());
// }

// class Kalkulator extends StatelessWidget {
//   const Kalkulator({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kalkulator',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CalculatorScreen(),
//     );
//   }
// }

// class CalculatorScreen extends StatefulWidget {
//   const CalculatorScreen({super.key});

//   @override
//   _CalculatorScreenState createState() => _CalculatorScreenState();
// }

// class _CalculatorScreenState extends State<CalculatorScreen> {
//   String _output = "0";
//   String _input = "";

//   void _buttonPressed(String buttonText) {
//     setState(() {
//       if (buttonText == "=") {
//         try {
//           _output = _evaluateExpression(_input);
//           _input = _output;
//         } catch (e) {
//           _output = "Error";
//         }
//       } else if (buttonText == "C") {
//         _input = "";
//         _output = "0";
//       } else {
//         _input += buttonText;
//         _output = _input;
//       }
//     });
//   }

//   String _evaluateExpression(String expression) {
//     return expression;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Kalkulator'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.all(20.0),
//               alignment: Alignment.bottomRight,
//               child: Text(
//                 _output,
//                 style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           Divider(),
//           Row(
//             children: <Widget>[
//               _buildButton("7", Colors.grey),
//               _buildButton("8", Colors.grey),
//               _buildButton("9", Colors.grey),
//               _buildButton("/", Colors.orange),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               _buildButton("4", Colors.grey),
//               _buildButton("5", Colors.grey),
//               _buildButton("6", Colors.grey),
//               _buildButton("*", Colors.orange),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               _buildButton("1", Colors.grey),
//               _buildButton("2", Colors.grey),
//               _buildButton("3", Colors.grey),
//               _buildButton("-", Colors.orange),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               _buildButton("C", Colors.red),
//               _buildButton("0", Colors.grey),
//               _buildButton("=", Colors.green),
//               _buildButton("+", Colors.orange),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton(String buttonText, Color color) {
//     return Expanded(
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           padding: EdgeInsets.all(24.0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//         child: Text(
//           buttonText,
//           style: TextStyle(fontSize: 24.0, color: Colors.white),
//         ),
//         onPressed: () => _buttonPressed(buttonText),
//       ),
//     );
//   }
// }
