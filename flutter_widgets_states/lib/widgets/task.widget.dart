import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String nome;
  const TaskWidget({
    super.key,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
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
                SizedBox(
                  width: 200,
                  child: Text(
                    nome,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 24,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: const Icon(Icons.arrow_drop_up),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
