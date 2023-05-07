import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/cubit/weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/screens/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather app'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is WeatherSuccess)
            return SuccessBody();
          else if (state is WeatherFaluire)
            return Center(
                child: Text('Something went wrong 🥲 please try again'));
          else
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'there is no weather😴 start searching now🔍',
                style: TextStyle(fontSize: 25),
              )),
            );
        },
      ),
      //
      // :
    );
  }
}

class SuccessBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<WeatherCubit>(context).model;
    return Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          BlocProvider.of<WeatherCubit>(context).model!.getThemeColor(),
          BlocProvider.of<WeatherCubit>(context).model!.getThemeColor()[300]!,
          BlocProvider.of<WeatherCubit>(context).model!.getThemeColor()[100]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Spacer(
            flex: 3,
          ),
          Text(
            '${cubit!.locationName}',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text('${cubit.date}', style: TextStyle(fontSize: 15)),
          Spacer(
            flex: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('${cubit!.getImage()}'),
              SizedBox(
                width: 20,
              ),
              Text(
                '${cubit!.temp.toInt()}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text('${cubit!.maxTemp.toInt()}'),
                  Text('${cubit!.minTemp.toInt()}'),
                ],
              )
            ],
          ),
          Spacer(
            flex: 3,
          ),
          Text(cubit!.weatherStateName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Spacer(
            flex: 5,
          ),
        ]),
      ),
    );
  }
}
