import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_states/features/home/form.dart';
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
      body: ListView(
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
            1,
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const FormScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
