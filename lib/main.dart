import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/cubit/weather_states.dart';
import 'package:weatherapp/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/services/weather_services.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => WeatherCubit(WeatherService()),
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).model != null
            ? BlocProvider.of<WeatherCubit>(context).model!.getThemeColor()
            : Colors.blue,
        brightness: Brightness.light,
      ),
      home: HomeScreen(),
    );
  }
}
