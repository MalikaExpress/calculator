import 'package:flutter/material.dart';

class Kalku extends StatefulWidget {
  const Kalku({super.key});

  @override
  State<Kalku> createState() => _CalculatorState();
}

class _CalculatorState extends State<Kalku> {
  String _display = '';
  String _temp = '';
  List<String> _operations = [];
  bool _justCalculated = false;

  void _buttonPressed(String text) {
    setState(() {
      if (_display == 'Error') {
        if (text == 'C') {
          _clearAll();
        }
        return;
      }

      if (text == 'C') {
        _clearAll();
      } else if (text == '+' || text == '-' || text == 'x' || text == ':') {
        if (_justCalculated) {
          _operations = [_display];
          _justCalculated = false;
        }
        _addOperation(text);
      } else if (text == '=') {
        _calculateResult();
      } else if (text == '⌫') {
        _backspace();
      } else {
        if (_justCalculated) {
          _clearAll();
        }
        _updateTemp(text);
      }
    });
  }

  void _clearAll() {
    _display = '';
    _temp = '';
    _operations.clear();
    _justCalculated = false;
  }

  void _addOperation(String operation) {
    if (_display.isEmpty && operation == '-') {
      // Jika '-' adalah input pertama, maka ini adalah angka negatif, bukan operator
      _temp += operation;
      _display += operation;
      return;
    }

    if (_display.isNotEmpty && _isLastCharacterOperator()) {
      if (operation == '-' && _isLastCharacterMinus()) {
        // Jika operator terakhir adalah '-' dan operator baru juga '-', anggap ini sebagai angka negatif
        _temp += operation;
        _display += operation;
        return;
      }

      if (operation == '-' && _isLastCharacterMinus()) {
        // Batalkan input jika sudah ada dua tanda minus berturut-turut
        return;
      }

      if (operation != '-' && _isLastCharacterOperator()) {
        // Cegah operator berturut-turut selain '-'
        _display = 'Error';
        _clearAll();
        return;
      }
    }

    if (_temp.isNotEmpty) {
      _operations.add(_temp);
    }
    _operations.add(operation);
    _display += operation;
    _temp = '';
  }

  bool _isLastCharacterOperator() {
    if (_display.isEmpty) return false;
    String lastChar = _display[_display.length - 1];
    return lastChar == '+' ||
        lastChar == '-' ||
        lastChar == 'x' ||
        lastChar == ':';
  }

  bool _isLastCharacterMinus() {
    if (_display.isEmpty) return false;
    String lastChar = _display[_display.length - 1];
    return lastChar == '-';
  }

  void _calculateResult() {
    if (_temp.isNotEmpty) {
      _operations.add(_temp);
    }

    if (_isLastCharacterOperator()) {
      _display = 'Error';
      _clearAll();
      return;
    }

    try {
      double result = double.parse(_operations[0]);

      for (int i = 1; i < _operations.length; i += 2) {
        String operator = _operations[i];
        double nextNumber = double.parse(_operations[i + 1]);

        switch (operator) {
          case '+':
            result += nextNumber;
            break;
          case '-':
            result -= nextNumber;
            break;
          case 'x':
            result *= nextNumber;
            break;
          case ':':
            if (nextNumber != 0) {
              result /= nextNumber;
            } else {
              _display = 'Error';
              _clearAll();
              return;
            }
            break;
        }
      }

      _display = result.toString();
    } catch (e) {
      _display = 'Error';
    }

    _temp = '';
    _operations.clear();
    _justCalculated = true;
  }

  void _updateTemp(String value) {
    if (_display == 'Error') {
      return; // Jangan update jika error
    }
    if (value == '.') {
      // Tambahkan logika untuk menambahkan titik desimal
      if (_temp.isEmpty || _temp.contains('.')) return;
      _temp += value;
      _display += value;
    } else {
      if (_display == '0' && value == '0') return;
      _temp += value;
      _display += value;
    }
  }

  void _backspace() {
    if (_justCalculated) {
      _clearAll();
      return;
    }

    if (_display == 'Error') {
      return; // Jangan hapus jika error
    }

    if (_temp.isNotEmpty) {
      _temp = _temp.substring(0, _temp.length - 1);
      _display = _display.substring(0, _display.length - 1);
    } else if (_display.isNotEmpty) {
      _display = _display.substring(0, _display.length - 1);
      // Hapus dari operasi jika perlu
      if (_operations.isNotEmpty) {
        _operations.removeLast();
      }
    }
  }

  Widget _buildButton(String text, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(20.0),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 30.0),
        ),
        onPressed: () => _buttonPressed(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kalkulator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 50, 55),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(20.0),
            child: Text(
              _display,
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(height: 1, color: Colors.black),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("7", Colors.grey[800]!),
                  _buildButton("8", Colors.grey[800]!),
                  _buildButton("9", Colors.grey[800]!),
                  _buildButton("x", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4", Colors.grey[800]!),
                  _buildButton("5", Colors.grey[800]!),
                  _buildButton("6", Colors.grey[800]!),
                  _buildButton(":", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1", Colors.grey[800]!),
                  _buildButton("2", Colors.grey[800]!),
                  _buildButton("3", Colors.grey[800]!),
                  _buildButton("+", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("⌫", const Color.fromARGB(255, 255, 31, 31)!),
                  _buildButton("0", Colors.grey[800]!),
                  _buildButton(".", Color.fromARGB(255, 40, 208, 255)!),
                  _buildButton("-", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("C", const Color.fromARGB(255, 168, 54, 244)),
                  _buildButton("=", Colors.green),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
