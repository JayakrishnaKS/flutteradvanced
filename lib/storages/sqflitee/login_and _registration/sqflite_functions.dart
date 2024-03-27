import 'package:sqflite/sqflite.dart' as sql;

class SQL_Functions {
  static Future<sql.Database> openOrCreateDb() async {
    return sql.openDatabase('users', version: 1,
        onCreate: (sql.Database db, int version) async {
      await createTable(db);
    });
  }

  static Future<void> createTable(sql.Database db) async {
    await db.execute(
        'CREATE TABLE userdata (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, email TEXT, password TEXT)');
  }

  static Future<int> addUser(String name, String email, String password) async {
    var db = await SQL_Functions.openOrCreateDb();
    var data = {'name': name, 'email': email, 'password': password};
    var id = db.insert('userdata', data);
    return id;
  }

  static Future<List<Map>> checkUserExist(String email, String pwd) async {
    var db = await SQL_Functions.openOrCreateDb();
    final data = await db.rawQuery(
        "SELECT * FROM userdata WHERE email ='$email'' AND password =''$pwd'");
    if (data.isNotEmpty) {
      return data;
    } else {
      return data;
    }
  }

  static Future<List<Map>> checkUser_already_registered(String email) async {
    var db = await SQL_Functions.openOrCreateDb();
    final user =
        await db.rawQuery("SELECT * FROM userdata WHERE email ='$email' ");
    if (user.isNotEmpty) {
      return user;
    } else {
      return user;
    }
  }

  static Future<List<Map<String,dynamic>>> getAllUsers() async {
    var db = await SQL_Functions.openOrCreateDb();
    final allUsers = await db.rawQuery("SELECT * FROM userdata");
    return allUsers;
  }

  static Future<void> dltUser(int id) async{
    var db=await SQL_Functions.openOrCreateDb();
    db.delete('userdata',where:'id = ?' ,whereArgs: [id]);
  }

  static Future<int> update(int id, String uname, String uemail) async{
    var db=await SQL_Functions.openOrCreateDb();
    final newdata={'name':uname,'email':uemail};
    final newid=await db.update('userdata', newdata,where: 'id = ?',whereArgs: [id] );
    return newid;

  }
}

/// to read all the data /users from the db
