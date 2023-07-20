import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/todo_app_cubit.dart';
import 'package:weatherapp/screens/widgets/list_view_item.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoAppCubit, TodoAppState>(
      builder: (context, state) {
        var tasks = TodoAppCubit.get(context).doneTasks;
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => ListViewItem(model: tasks[index]),
            separatorBuilder: (context, index) => Container(
                  color: Colors.grey[300],
                  height: 1,
                ),
            itemCount: tasks.length);
      },
    );
  }
}
