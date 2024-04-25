import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Test'),
        ),
        body: wi());
  }
}

Widget wi() {
  return Center(
    child: Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text("This"),
              Text("This is"),
              Text("not this"),
            ],
          ),
        ),
        Column(
          children: List.generate(10, (index) {
            return tallButton("Button" + index.toString(), () {
              // ボタンがタップされたときの処理
            });
          }),
        ),
      ],
    ),
  );
}

Widget tallButton(String buttonText, VoidCallback onPressedCallback) {
  return SizedBox(
    width: double.infinity, // ボタンをコンテナの幅いっぱいに拡張
    child: ElevatedButton(
      onPressed: onPressedCallback,
      child: Text(buttonText),
    ),
  );
}
