import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/cubit/weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherservice) : super(WeatherInitial());
  WeatherService weatherservice;
  WeatherModel? model;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      model = await weatherservice.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFaluire());
    }
  }
}
