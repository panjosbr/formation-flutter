import 'package:flutter_widgets_states/data/task.dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// Future<Database> getDatabase() async {
//   print('abrindo db');
//   final String path = join(await getDatabasesPath(), 'taskTable.db');
//   return openDatabase(
//     path,
//     onCreate: (db, version) {
//       db.execute(TaskDao.tableSql);
//     },
//     version: 1,
//   );
// }

Future<Database> getDatabase() async {
  print('abrindo db');
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
  await databaseFactory.databaseExists(inMemoryDatabasePath).then((value) {
    if (value) {
      db.execute(TaskDao.tableSql);
    }
  });
  return db;
}
