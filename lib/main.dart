import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/todo_app_cubit.dart';
import 'package:weatherapp/screens/constants.dart';
import 'package:weatherapp/screens/new_atsks.dart';
import 'package:weatherapp/screens/main_screen.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoAppCubit()..CreateDatabase(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: defaultColor),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
