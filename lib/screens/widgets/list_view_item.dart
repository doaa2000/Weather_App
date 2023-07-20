import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/todo_app_cubit.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.model});

  final Map model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoAppCubit, TodoAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TodoAppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 35,
                    child: Text(
                      '${model['name']}',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      cubit.UpdateDatabase(status: 'archive', id: model['id']);
                    },
                    color: Colors.green,
                    icon: Icon(
                      Icons.archive_outlined,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      cubit.UpdateDatabase(status: 'done', id: model['id']);
                    },
                    color: Colors.red,
                    icon: Icon(
                      Icons.done,
                      size: 30,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
