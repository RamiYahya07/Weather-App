import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState >(
          builder: (context, state) {
            return MaterialApp(
              // theme: ThemeData(brightness: Brightness.dark),
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.weatherCondition),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blue;
  if (condition == 'Sunny' || condition == 'Clear') {
    return Colors.amber; // Sunny or Clear
  } else if (condition == 'Partly cloudy') {
    return Colors.orange; // Partly cloudy
  } else if (condition == 'Cloudy' || condition == 'Overcast') {
    return Colors.grey; // Cloudy or Overcast
  } else if (condition == 'Mist' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.blueGrey; // Mist, Fog, Freezing Fog
  } else if (condition == 'Patchy rain possible' ||
      condition == 'Patchy light rain' ||
      condition == 'Light rain' ||
      condition == 'Light drizzle' ||
      condition == 'Patchy light drizzle') {
    return Colors.lightBlue; // Light rain, drizzle
  } else if (condition == 'Moderate rain' ||
      condition == 'Heavy rain' ||
      condition == 'Moderate rain at times' ||
      condition == 'Heavy rain at times' ||
      condition == 'Torrential rain shower') {
    return Colors.blue; // Moderate to heavy rain
  } else if (condition == 'Thundery outbreaks possible' ||
      condition == 'Patchy light rain with thunder' ||
      condition == 'Moderate or heavy rain with thunder') {
    return Colors.deepPurple; // Thunderstorms
  } else if (condition == 'Patchy snow possible' ||
      condition == 'Light snow' ||
      condition == 'Patchy light snow' ||
      condition == 'Blowing snow' ||
      condition == 'Blizzard') {
    return Colors.cyan; // Snowy or Blizzard conditions
  } else if (condition == 'Moderate snow' ||
      condition == 'Heavy snow' ||
      condition == 'Patchy heavy snow' ||
      condition == 'Moderate or heavy snow showers' ||
      condition == 'Moderate or heavy snow with thunder') {
    return Colors.cyan; // Heavy snow
  } else if (condition == 'Patchy sleet possible' ||
      condition == 'Light sleet' ||
      condition == 'Moderate or heavy sleet' ||
      condition == 'Light freezing rain' ||
      condition == 'Freezing drizzle') {
    return Colors.teal; // Sleet or freezing rain
  } else if (condition == 'Ice pellets' ||
      condition == 'Light showers of ice pellets' ||
      condition == 'Moderate or heavy showers of ice pellets') {
    return Colors.indigo; // Ice pellets
  } else {
    return Colors.grey; // Default for unhandled conditions
  }
}
