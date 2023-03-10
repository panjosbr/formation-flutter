import 'package:flutter_widgets_states/data/task.dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  print('abrindo db');
  final String path = join(await getDatabasesPath(), 'taskTable.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 1,
  );
}
