import 'package:flutter/material.dart';
import 'package:flutter_widgets_states/widgets/task.widget.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<TaskWidget> taskList = [
    TaskWidget('Aprender Flutter Aprender', 'lib/assets/images/twitter.png', 5),
    TaskWidget('Ler', 'lib/assets/images/livro.jpg', 3),
    TaskWidget('Jogar', 'lib/assets/images/randon.jpg', 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(TaskWidget(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
