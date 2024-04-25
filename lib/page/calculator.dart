import 'package:flutter/material.dart';

class Calculater extends StatefulWidget {
  @override
  _CalculaterState createState() => _CalculaterState();
}

class _CalculaterState extends State<Calculater> {
  String _input = "";
  String _output = "0";
  var calculate = Calculate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _input,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    _output,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 100, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _customButton('C'),
                        _customButton('+/-'),
                        _customButton('%'),
                        _customButton('/'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _customButton('7'),
                      _customButton('8'),
                      _customButton('9'),
                      _customButton('*'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      _customButton('4'),
                      Container(color: Colors.white, child: _customButton('5')),
                      _customButton('6'),
                      _customButton('-'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _customButton('1'),
                      _customButton('2'),
                      _customButton('3'),
                      _customButton('+'),
                    ],
                  ),
                  Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(color:Colors.white,child: _customButton('0')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _customButton('.'),
                            _customButton('='),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }

  Widget _customButton(String text) {
    Color color = Colors.black;
    List<String> orange = ["/", "*", "+", "-", "="];
    List<String> grey = ["C", "+/-", "%"];
    if (orange.contains(text)) {
      color = Colors.orange;
    }
    if (grey.contains(text)) {
      color = Colors.grey;
    }

    ShapeBorder buttonShape = const CircleBorder();
    List<double> minWidthAndHeight = [80, 80];

    if (text == "0") {
      buttonShape = const StadiumBorder();
      minWidthAndHeight = [170, 80];
    }

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: MaterialButton(
        onPressed: () => _updateInput(text),
        // minWidth: minWidthAndHeight[0],
        // height: minWidthAndHeight[1],
        shape: buttonShape,
        color: color,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
      ),
    );
  }

  void _updateInput(text) {
    List<String> inputs;
    inputs = calculate.calculateMain([_input, _output], text);
    _editVariable(inputs);
  }

  void _editVariable(List<String> inputs) {
    setState(() {
      _input = inputs[0];
      _output = inputs[1];
    });
  }
}

class Calculate {
  Calculate();
  List<String> operators = ['+', '-', '*', '/', '=', 'C'];

  List<String> calculateMain(List<String> inputs, String value) {
    bool state;
    List<String> stack;

    [inputs, state] = _operatorsIF(inputs, value);
    if (!state) {
      return inputs;
    }

    stack = _extractTerm(inputs[0]);
    inputs[1] = _eval(stack);
    inputs[1] = _removeDecimal(inputs[1]);
    inputs[0] = inputs[1];
    return inputs;
  }

  String _removeDecimal(String n) {
    if (n.contains('.')) {
      if (double.parse(n) == double.parse(n.split('.')[0])) {
        return n.split('.')[0];
      } else {
        return n;
      }
    } else {
      return n;
    }
  }

  List<dynamic> _operatorsIF(List<String> inputs, String value) {
    List<String> bandIputs = List.from(operators);
    bandIputs.addAll(["0", ""]);
    bool state = false;

    if (inputs[0] == "null" || inputs[0] == "0") {
      inputs = ["", ""];
    }

    // 演算子が_inputに入っていとき演算子の追加は禁止。
    // _input == ("0" || "") > 演算子追加禁止
    if (operators.contains(value) && bandIputs.contains(inputs[0])) {
    } else {
      if (value == '=') {
        state = true;
      } else if (value == 'C') {
        // 入力をクリア
        inputs[0] = "";
        inputs[1] = "0";
      } else {
        // 数字や演算子を入力
        inputs[0] += value;
      }
    }
    return [inputs, state];
  }

  List<String> _extractTerm(String expression) {
    // expression is inputs[0]
    final tokens = expression.replaceAll(' ', '').split('');
    List<String> stack = [""];

    for (final token in tokens) {
      if (double.tryParse(token) != null) {
        stack[stack.length - 1] += token;
      } else {
        stack.addAll([token, ""]);
      }
    }
    return stack;
  }

  String _eval(List<String> stack) {
    try {
      String token = stack[1];
      double operand1 = double.parse(stack[0]);
      double operand2 = double.parse(stack[2]);
      String result;

      switch (token) {
        case '+':
          result = (operand1 + operand2).toString();
          break;
        case '-':
          result = (operand1 - operand2).toString();
          break;
        case '*':
          result = (operand1 * operand2).toString();
          break;
        case '/':
          result = (operand1 / operand2).toString();
          break;
        default:
          throw ArgumentError('Invalid operator');
      }

      return result;
    } catch (e) {
      return "null";
    }
  }
}


