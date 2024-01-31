import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model.dart';
import '../service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.service}) : super(WeatherInitial());
  final WeatherService service;
  Future<void> fetchData() async {
    emit(WeatherLoading());
    final data = await service.getData();
    if (data != null) {
      emit(WeatherSuccess(weatherModel: data));
    } else {
      emit(const WeatherError(text: 'ERRORTEXT'));
    }
  }
}
