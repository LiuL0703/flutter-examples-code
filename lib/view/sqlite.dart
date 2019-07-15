import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';


class SqliteDemo extends StatefulWidget {
  SqliteDemo({Key key}) : super(key: key);

  _SqliteDemoState createState() => _SqliteDemoState();
}

class _SqliteDemoState extends State<SqliteDemo> {

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async{
    final database = openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version){
        return db.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
      version: 1,
    );

    Future<void> insertDog(Dog dog) async {
      final Database db = await database;

      await db.insert(
        'dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    Future<List<Dog>> dogs() async {
      final Database db = await database;

      final List<Map<String, dynamic>> maps = await db.query('dogs');

      return List.generate(maps.length, (i){
        return Dog(
          id: maps[i]['id'],
          name: maps[i]['name'],
          age: maps[i]['age'],
        );
      });
    }

    Future<void> updateDog(Dog dog) async{
      final db = await database;
      await db.update(
        'dogs',
        dog.toMap(),
        where: "id = ?",
        whereArgs: [dog.id],
      );
    }

    Future<void> deleteDog(int id) async {
      final db = await database;
      await db.delete(
        'dogs',
        where: "id = ?",
        whereArgs: [id],
      );
    }

    var fido = Dog(
      id: 0, name: 'Fido', age: 13,
    );

    await insertDog(fido);

    print(await dogs());

    fido = Dog(
      id: fido.id,
      name: fido.name,
      age: fido.age + 10,
    );

    await updateDog(fido);
    print(await dogs());

    await deleteDog(fido.id);
    print(await dogs());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite'),
      ),
      body: Center(
        child: Text('Sqlite Demo'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.age,this.name});

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "age": age,
    };
  }

  @override
  String toString(){
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}