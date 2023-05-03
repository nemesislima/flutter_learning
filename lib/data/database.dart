//o uso do future aqui significa que o banco de dados precisa aguardar determinada informação para armazenar e dar início as devidas funcionalidades
import 'package:flutter_learning/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


Future<Database> getDatabase() async{

  final String path = join(await getDatabasesPath(),'task.db');
  return openDatabase(
      path,
      onCreate: (db,version) {
        db.execute(TaskDao.tableSql);

      },
      version: 1,
  );
}

