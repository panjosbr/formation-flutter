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
          leading: Container(),
          title: const Text('Tarefas'),
        ),
        body: ListView(
          children: [
            TaskWidget(
              'Aprender Flutter Aprender',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              5,
            ),
            TaskWidget(
              'Ler',
              'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
              3,
            ),
            TaskWidget(
              'Jogar',
              'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
              1,
            ),
          ],
        ),
      ),
    );
  }
}
