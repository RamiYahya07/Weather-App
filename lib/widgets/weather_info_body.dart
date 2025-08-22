import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);
  final condition = 'clear';
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weatherModel.image!}",
                ),
                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Maxtemp: ${weatherModel.maxTemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Mintemp: ${weatherModel.minTemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DateTime stringToDateTime(String value) {
  return DateTime.parse(value);
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
