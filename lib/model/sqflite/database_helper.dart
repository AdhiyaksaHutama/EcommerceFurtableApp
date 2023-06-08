import 'package:furniture_e_commerce/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;
  final String _tableName = 'cart';

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var db = openDatabase(join(await getDatabasesPath(), 'cart_db.db'),
        onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE $_tableName(id integer primary key autoincrement, productId integer, imageLink TEXT, name TEXT, category TEXT, material TEXT, price integer, qty integer)''');
    }, version: 1);
    return db;
  }

  Future<List<CartProductModel>> getProduct() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => CartProductModel.fromMap(e)).toList();
  }

  Future<List<CartProductModel>> checkProductById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.rawQuery(
      'SELECT * FROM $_tableName WHERE productId = ?',
      [id],
    );

    if (results.isNotEmpty) {
      return results.map((e) => CartProductModel.fromMap(e)).toList();
    } else {
      return [];
    }
  }

  Future<void> insertProduct(CartProductModel product) async {
    final Database db = await database;
    await db.insert(_tableName, product.toMap());
  }

  Future<void> updateProduct(int id, int qty) async {
    final db = await database;
    await db.update(
      _tableName,
      {
        'qty': qty,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllProduct() async {
    final db = await database;
    await db.delete(_tableName);
  }

  // Future<Contact> getProductById(int id) async {
  //   final Database db = await database;
  //   List<Map<String, dynamic>> results = await db.query(
  //     _tableName,
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  //   return results.map((e) => CartProductModel.fromMap(e)).first;
  // }
}
