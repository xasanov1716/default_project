
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/models/user_model.dart';

class LocalDatabase{
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase(){
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async{
    if(_database !=null){
      return _database!;
    }else{
      _database = await _initDB("defaultDatabase.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName)async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,dbName);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  Future _createDB(Database db, int version)async{
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";


    await db.execute('''
    CREATE TABLE ${UserFields.userTable}(
    ${UserFields.id} $idType,
    ${UserFields.age} $intType,
    ${UserFields.firstName} $textType,
    ${UserFields.lastName} $textType,
    ${UserFields.gender} $textType,
    ${UserFields.jobTitle} $textType
    )
    ''');
  }

  static Future<UserModel> insertUser(
      UserModel userModel) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        UserFields.userTable, userModel.toJson());
    return userModel.copyWith(id: id);
  }

  static Future<List<UserModel>> getAllUsers() async {
    List<UserModel> allUsers = [];
    final db = await getInstance.database;
    allUsers = (await db.query(UserFields.userTable))
        .map((e) => UserModel.fromJson(e))
        .toList();

    return allUsers;
  }

  static updateUser({required UserModel userModel}) async {
    final db = await getInstance.database;
    db.update(
      UserFields.userTable,
      userModel.toJson(),
      where: "${UserFields.id} = ?",
      whereArgs: [userModel.id],
    );
  }

  static deleteUser(int id) async {
    final db = await getInstance.database;
    db.delete(
      UserFields.userTable,
      where: "${UserFields.id} = ?",
      whereArgs: [id],
    );
  }

  static deleteAllUsers() async {
    final db = await getInstance.database;
    db.delete(
      UserFields.userTable,
    );
  }

}