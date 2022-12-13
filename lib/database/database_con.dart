import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'database_contacts');
    var database = await openDatabase(path, version: 1, onCreate: _createdb);
    return database;
  }

  Future<void> _createdb(Database database, int version) async {
    String sql =
        "CREATE TABLE contacts (id INTEGER PRIMARY KEY, name TEXT, contact TEXT, email TEXT);";
    await database.execute(sql);
  }
}
