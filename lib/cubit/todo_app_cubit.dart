import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../screens/archived_tasks.dart';
import '../screens/done_tasks.dart';
import '../screens/new_atsks.dart';
part 'todo_app_state.dart';

class TodoAppCubit extends Cubit<TodoAppState> {
  TodoAppCubit() : super(TodoAppInitial());

  static TodoAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  Database? database;

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  List<Widget> screens = [
    NewTasks(),
    ArchivedTasks(),
    DoneTasks(),
  ];
  void ChangeCurrentIndexMethod(int value) {
    currentIndex = value;
    emit(ChangeCurrentIndex());
  }

  //create database function

  void CreateDatabase() {
    openDatabase('mytaskapp.db', version: 1,
        onCreate: (database, version) async {
      print('database created');

      database
          .execute(
        'CREATE TABLE tasks (id INTEGER PRIMARY KEY , name TEXT , date TEXT , status TEXT)',
      )
          .then((value) {
        print('table created');
      });
    }, onOpen: (database) {
      getFromdatabase(database);
      print('database opened');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

// insert to database function

  insertToDatabase({
    required String taskName,
    required String taskDate,
  }) async {
    return await database?.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks (name, date, status) VALUES ("$taskName","$taskDate","new")');
    }).then((value) {
      print("$value inserted to dataabse");
      emit(InsertToDatabaseState());
      getFromdatabase(database);
    });
  }

  //update database function

  void UpdateDatabase({
    required String status,
    required int id,
  }) async {
    database!.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getFromdatabase(database);

      emit(UpdateDatabaseState());
    });
  }

// get from database function

  getFromdatabase(database) {
    newTasks = [];
    archivedTasks = [];
    doneTasks = [];
    return database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });
      print(newTasks);
      //emit(GetFromDatabaseState());
    });
  }
}
