import 'package:contents_buddy/database/database_con.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  //Insert Contact or save

  insertData(contacts, data) async {
    var connection = await database;
    return await connection?.insert(contacts, data);
  }

  //Read Data
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }
  //read single record by id

  readDataID(contacts, contactId) async {
    var connection = await database;
    return await connection
        ?.query(contacts, where: 'id=?', whereArgs: [contactId]);
  }
  //update contact
  updateContact(contacts, data) async {
    var connection = await database;
    return await connection
        ?.update(contacts, data, where: 'id=?', whereArgs: [data["id"]]);
  }

  //delete contact

  deletContact(contacts, contactId) async {
    var connection = await database;
    return await connection
        ?.rawDelete("delete from $contacts where id= $contactId");
  }
}
