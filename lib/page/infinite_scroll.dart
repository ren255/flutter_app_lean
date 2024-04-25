import 'dart:math';

import 'package:flutter/material.dart';

class InfiniteScroll extends StatelessWidget {
  Color randomColor() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('infinite scroll'),
        ),
        body: ListView.builder(itemBuilder: (_, index) {
          return Container(
            color: randomColor(),
            height: 400,
          );
        }));
  }
}
