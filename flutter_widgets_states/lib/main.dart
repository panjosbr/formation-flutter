import 'package:flutter/material.dart';
import 'package:flutter_widgets_states/data/task_inherited.dart';
import 'package:flutter_widgets_states/features/home/form.dart';
import 'package:flutter_widgets_states/features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(
        child: const HomePage(),
      ),
    );
  }
}
