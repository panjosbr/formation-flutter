import 'package:flutter/material.dart';

import 'widgets/task.widget.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarefas'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TaskWidget(
              nome: 'Aprender Flutter',
            ),
            TaskWidget(
              nome: 'Aprender Violão',
            ),
          ],
        ),
      ),
    );
  }
}
