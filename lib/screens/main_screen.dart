import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/todo_app_cubit.dart';
import 'package:weatherapp/screens/constants.dart';

import 'add_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoAppCubit, TodoAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TodoAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Todo App', style: TextStyle(fontSize: 20)),
          ),
          body: cubit.screens[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddTask()));
            },
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                TodoAppCubit.get(context).ChangeCurrentIndexMethod(value);
              },
              currentIndex: TodoAppCubit.get(context).currentIndex,
              elevation: 30,
              items: [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: 'Archive tasks', icon: Icon(Icons.archive_outlined)),
                BottomNavigationBarItem(
                    label: 'Done tasks', icon: Icon(Icons.done)),
              ]),
        );
      },
    );
  }
}
