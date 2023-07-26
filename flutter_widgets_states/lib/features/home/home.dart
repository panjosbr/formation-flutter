import 'package:flutter/material.dart';
import 'package:flutter_widgets_states/data/task.dao.dart';
import 'package:flutter_widgets_states/features/home/form.dart';
import 'package:flutter_widgets_states/widgets/loading.widget.dart';
import 'package:flutter_widgets_states/widgets/task.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 70,
        ),
        child: FutureBuilder<List<TaskWidget>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<TaskWidget>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const LoadingWidget();
              case ConnectionState.waiting:
                return const LoadingWidget();
              case ConnectionState.active:
                return const LoadingWidget();
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final TaskWidget task = items[index];
                        return task;
                      },
                    );
                  }

                  return Center(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          'Não há nenhuma tarefa,',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Text('Erro ao carregar tarefas');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext newContext) => FormScreen(
                  taskContext: context,
                ),
              )).then(
            (value) => setState(() {
              print('recarregando tela inicial');
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
