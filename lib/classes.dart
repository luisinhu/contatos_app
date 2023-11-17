import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class Contact {
  int? id;
  String name;
  String phone;
  String email;

  Contact({this.id, required this.name, required this.phone, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}

class DatabaseHelper {
  static const String dbName = 'contacts.db';
  static const String contactsTable = 'contacts';

  Future<Database> initializeDatabase() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    final path = join(await getDatabasesPath(), dbName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $contactsTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            phone TEXT,
            email TEXT
          )
          ''',
        );
      },
    );
  }

  Future<int> insertContact(Contact contact) async {
    final Database db = await initializeDatabase();
    return db.insert(contactsTable, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query(contactsTable);

    return List.generate(maps.length, (i) {
      return Contact(
        id: maps[i]['id'],
        name: maps[i]['name'],
        phone: maps[i]['phone'],
        email: maps[i]['email'],
      );
    });
  }

  Future<void> deleteContact(int id) async {
    final Database db = await initializeDatabase();
    await db.delete(
      contactsTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  Future<void> updateContact(Contact contact) async {
  final Database db = await initializeDatabase();
  await db.update(
    contactsTable,
    contact.toMap(),
    where: 'id = ?',
    whereArgs: [contact.id],
  );
}
}
