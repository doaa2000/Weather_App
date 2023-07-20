part of 'todo_app_cubit.dart';

@immutable
abstract class TodoAppState {}

class TodoAppInitial extends TodoAppState {}

class CreateDatabaseState extends TodoAppState {}

class InsertToDatabaseState extends TodoAppState {}

class GetFromDatabaseState extends TodoAppState {}

class UpdateDatabaseState extends TodoAppState {}

class DeleteDatabaseState extends TodoAppState {}

class ChangeCurrentIndex extends TodoAppState {}
