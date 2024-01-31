part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherSuccess({required this.weatherModel});
}

final class WeatherError extends WeatherState {
  final String text;

  const WeatherError({required this.text});
}
