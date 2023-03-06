import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_states/widgets/task.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: Duration(milliseconds: 1000),
        child: ListView(
          children: const [
            TaskWidget(
              'Aprender Flutter Aprender',
              'lib/assets/images/twitter.png',
              5,
            ),
            TaskWidget(
              'Ler',
              'lib/assets/images/livro.jpg',
              3,
            ),
            TaskWidget(
              'Jogar',
              'lib/assets/images/randon.jpg',
              4,
            ),
            TaskWidget(
              'Jogar',
              'lib/assets/images/livro.jpg',
              1,
            ),
            TaskWidget(
              'Jogar',
              'lib/assets/images/twitter.png',
              2,
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
