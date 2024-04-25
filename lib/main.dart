import 'package:flutter/material.dart';
import 'page/test.dart';
import 'page/scrollable_text.dart';
import 'page/infinite_scroll.dart';

import 'page/calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class button_for_next_page extends StatelessWidget {
  final String buttonText;
  final Widget nextPage;

  button_for_next_page(this.buttonText, this.nextPage);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // ボタンがタップされたときに新しいページに遷移
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Text(buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
            )),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Map<String, Widget> pages = {
    "Calculator": Calculater(),
    "infinite scroll": InfiniteScroll(),
    "ScrollableText": ScrollableText(),
    "test": Test(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ...pages.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: button_for_next_page(entry.key, entry.value),
                );
              }),
            ],
          ),
        ));
  }
}
