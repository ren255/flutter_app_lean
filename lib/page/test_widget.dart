import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Simple Text App'),
          ),
          body: Row(
            children: [
              MaterialButton(
                onPressed: () => null,
                // minWidth: minWidthAndHeight[0],
                // height: minWidthAndHeight[1],
                shape: const CircleBorder(),
                color: Colors.black,
                child: Container(
                  color: Colors.red,
                  child: const Text(
                    "l",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () => null,
                // minWidth: minWidthAndHeight[0],
                // height: minWidthAndHeight[1],
                shape: const CircleBorder(),
                color: Colors.black,
                child: Container(
                  color: Colors.red,
                  child: const Text(
                  "l",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

