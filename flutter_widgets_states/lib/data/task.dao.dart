import 'package:flutter_widgets_states/data/database.dart';
import 'package:flutter_widgets_states/widgets/task.widget.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'tasktable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  List<TaskWidget> toList(List<Map<String, dynamic>> mapTarefas) {
    print('toList');
    final List<TaskWidget> tarefas = [];
    for (Map<String, dynamic> linha in mapTarefas) {
      final TaskWidget task =
          TaskWidget(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(task);
    }
    print('Lista de Tarefas: ${tarefas.toList()}');
    return tarefas;
  }

  Map<String, dynamic> toMap(TaskWidget task) {
    print('convertendo task in map');
    final Map<String, dynamic> mapaTarefas = {};
    mapaTarefas[_name] = task.nome;
    mapaTarefas[_difficulty] = task.dificuldade;
    mapaTarefas[_image] = task.url;
    print('Mapa de tarefas: $mapaTarefas');
    return mapaTarefas;
  }

  save(TaskWidget task) async {
    print('save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(task.nome);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      print('Tarefa nao existe');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('Essa tarefa ja existe');
      return await bancoDeDados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [task.nome]);
    }
  }

  Future<List<TaskWidget>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  Future<List<TaskWidget>> find(String taskName) async {
    print('find: ');

    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );

    print('Procurando dados .... encontrado: ${toList(result)} ');
    return toList(result);
  }

  delete(String taskName) async {
    print('Deletando tarefa: $taskName');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }
}
