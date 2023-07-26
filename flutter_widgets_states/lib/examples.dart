import 'package:flutter/material.dart';

class ExampleWidget {
  Widget _elevatedButton() {
    return ElevatedButton(onPressed: () {}, child: const Text('Salvar'));
  }

  Widget text(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: color,
        decoration: TextDecoration.none,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget screen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        stack(),
        stack(),
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
          ],
        ),
        _elevatedButton(),
      ],
    );
  }

  Widget row() {
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

  Widget col() {
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

  Widget stack() {
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
