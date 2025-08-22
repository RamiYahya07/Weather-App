import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitalState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState({required this.errorMessage});
}
