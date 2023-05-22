import 'package:sqflite/sqflite.dart';

class DatabaseApp
{
  Database db;
  List mylist=[];
  DatabaseApp()
  {
    createDatabase();
  }
  createDatabase()async
  {
    db=await openDatabase(
      'us.db',
      version: 1,
      onCreate: (d,v)async{
       await d.execute(
           'create table user (id integer primary key , name text ,password text)');
      print('create table');
      },
      onOpen: (d){
        print('open');
        getData(d).then((value) {
          mylist=value;
          print(value);
        });
      }

    );
  }
  insertData(String name,String password)
  {
    db.transaction((txn) {
      txn.rawInsert('insert into user (name,password) values("$name","$password")').then((value){
        print('inserted $value');
      });
      return null;
    });
  }
  Future<List> getData(Database d)async
  {
    return await d.rawQuery('select * from user');
  }
}
