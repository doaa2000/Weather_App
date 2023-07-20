import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/todo_app_cubit.dart';
import 'package:weatherapp/screens/widgets/custom_button_widget.dart';
import 'package:weatherapp/screens/widgets/custom_text_form_feild.dart';
import 'package:weatherapp/screens/widgets/list_view_item.dart';

var nameController = TextEditingController();
var dateController = TextEditingController();

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoAppCubit, TodoAppState>(
      listener: (context, state) => () {},
      builder: (context, state) {
        var cubit = TodoAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Add Task'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormFeild(
                      onPressed: () {},
                      controller: nameController,
                      text: 'task name'),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormFeild(
                      onPressed: () {},
                      controller: dateController,
                      text: 'task date :::)'),
                  CustomButtonWidget(
                    onTap: () {
                      cubit.insertToDatabase(
                          taskName: nameController.text,
                          taskDate: dateController.text);
                    },
                    text: 'add task :)',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
