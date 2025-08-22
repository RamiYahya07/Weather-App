import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: ((value) async {
              var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
              getweathercubit.getWeather(cityName: value);
              Navigator.of(context).pop();
            }),
            autofillHints: ['Damascus', 'Cairo'],
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search_rounded),
              hintText: 'Enter city Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//create states 
//create cubit 
//create funcitons 
// provide cubit 
//integrate cubit
//trigger cubit
