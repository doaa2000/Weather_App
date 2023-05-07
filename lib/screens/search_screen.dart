import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';

import 'package:weatherapp/services/weather_services.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;
  WeatherModel? model;
  WeatherCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City '),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onChanged: (data) {
            cityName = data;
          },
          onSubmitted: (data) async {
            cityName = data;
            BlocProvider.of<WeatherCubit>(context)
                .getWeather(cityName: cityName!);
            BlocProvider.of<WeatherCubit>(context).cityName = cityName;
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            label: Text('Search'),
            suffixIcon: GestureDetector(
                onTap: () async {
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeather(cityName: cityName!);
                  BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                  Navigator.pop(context);
                },
                child: Icon(Icons.search)),
            border: OutlineInputBorder(),
            hintText: 'Enter a City',
          ),
        ),
      )),
    );
  }
}
