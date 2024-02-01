import 'dart:developer';
import 'package:contact_diary/modal/data_modal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper databaseHelper = DatabaseHelper._();

  late Database database;

  String sql = '';

  String tableName = 'contacts';
  String contactId = 'id';
  String contactName = 'cName';
  String contactNumber = 'cNumber';

  Future<void> initDb() async {
    String dbPath = await getDatabasesPath();
    String dbName = 'my_db.db';
    String path = join(dbPath, dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, ver) {
        sql =
            'CREATE TABLE IF NOT EXISTS $tableName($contactId INTEGER PRIMARY KEY AUTOINCREMENT,$contactName TEXT, $contactNumber TEXT)';

        db
            .execute(sql)
            .then((value) => log('table Created...!!'))
            .onError((error, stackTrace) => ('Failed...!!'));
      },
    );
  }

  Future<int> insertRecord({required Contact contact}) async {
    await initDb();
    Map<String, dynamic> data = contact.toMap();
    data.remove('id');
    return database.insert(tableName, data);
  }

  Future<List<Contact>> getRecords() async {
    await initDb();
    sql = 'SELECT * FROM $tableName';
    List allData = await database.rawQuery(sql);

    return allData
        .map(
          (e) => Contact.fromMap(data: e),
        )
        .toList();
  }

  Future<int> deleteRecord({required int id}) async {
    await initDb();

    return database.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateRecord({required Contact contact}) async {
    await initDb();
    sql =
        "UPDATE $tableName SET cName='${contact.name}',cNumber=${contact.number} WHERE id=${contact.id}";
    return database.rawUpdate(sql);
  }
}
