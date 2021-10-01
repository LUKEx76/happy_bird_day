import 'package:happy_bird_day/models/birthday.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database =
        await openDatabase('birthdays.db', version: 1, onCreate: _createDB);
    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Birthdays (
        _id INTEGER PRIMARY KEY AUTOINCREMENT,
        Name TEXT NOT NULL,
        BirthDay INTEGER NOT NULL,
        BirthMonth INTEGER NOT NULL,
        BirthYear INTEGER
      )
    ''');
  }

  Future closeDB() async {
    final db = await instance.database;
    db.close();
  }

  Future<int> createBirthday(Birthday birthday) async {
    final db = await instance.database;
    return await db.insert('Birthdays', birthday.toJson());
  }

  Future<Birthday?> getBirthday(int id) async {
    final db = await instance.database;
    final query = await db.query(
      'Birthdays',
      where: '_id = ?',
      whereArgs: [id],
    );

    if (query.isNotEmpty) {
      return Birthday.fromJson(query.first);
    }
    return null;
  }

  Future<List<Birthday>> getAllBirthdays() async {
    final db = await instance.database;
    final query = await db.query('Birthdays');

    return query.map((json) => Birthday.fromJson(json)).toList();
  }

  Stream<List<Birthday>> get birthdayStream {
    //That wont work :(
    return Stream.fromFuture(getAllBirthdays());
  }

  Future<int> updateBirthday(Birthday birthday) async {
    final db = await instance.database;

    return await db.update(
      'Birthday',
      birthday.toJson(),
      where: '_id = ?',
      whereArgs: [birthday.id],
    );
  }

  Future<int> deleteBirthday(Birthday birthday) async {
    final db = await instance.database;

    if (birthday.id != null) {
      return await db.delete(
        'Birthdays',
        where: '_id = ?',
        whereArgs: [birthday.id],
      );
    }
    return 0;
  }
}
