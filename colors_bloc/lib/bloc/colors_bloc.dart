import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'colors_event.dart';
part 'colors_state.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  bool color = true;
  ColorsBloc() : super(ColorsInitial()) {
    on<ToRedColor>((event, emit) {
      redColorFunction();
    });
    on<ToGreenColor>((event, emit) {
      greenColorFunction();
    });
  }

  void redColorFunction() {
    emit(ColorRed(redColor: color = true));
  }

  void greenColorFunction() {
    emit(ColorGreen(greenColor: color = false));
  }
}
