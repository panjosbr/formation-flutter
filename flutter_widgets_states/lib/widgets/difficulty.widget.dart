import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DifficultyWidget extends StatelessWidget {
  DifficultyWidget({
    super.key,
    required this.dificuldade,
  });

  int nivel = 0;

  final int dificuldade;

  Color getColor(int number) {
    return dificuldade >= number ? Colors.blue : Colors.blue.shade100;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: getColor(1),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: getColor(2),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: getColor(3),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: getColor(4),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: getColor(5),
        ),
      ],
    );
  }
}
