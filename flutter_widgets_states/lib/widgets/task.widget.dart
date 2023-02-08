import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String nome;
  const TaskWidget({
    super.key,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          height: 140,
        ),
        Container(
          color: Colors.white,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black26,
                width: 72,
                height: 100,
              ),
              Text(nome),
              ElevatedButton(
                onPressed: () => {},
                child: const Icon(Icons.arrow_drop_up),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
