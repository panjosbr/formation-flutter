import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _screen(),
    );
  }

  Widget _screen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _stack(),
        _stack(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.cyan,
              width: 50,
              height: 50,
            ),
            Container(
              color: Colors.blueAccent,
              width: 50,
              height: 50,
            ),
            Container(
              color: Colors.red,
              width: 50,
              height: 50,
            ),
          ],
        ),
      ],
    );
  }

  Widget _row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
        Container(
          color: Colors.blueAccent,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  Widget _col() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
        Container(
          color: Colors.blueAccent,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  Widget _stack() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
        Container(
          color: Colors.blueAccent,
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}