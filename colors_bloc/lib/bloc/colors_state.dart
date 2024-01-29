part of 'colors_bloc.dart';

@immutable
sealed class ColorsState {}

final class ColorsInitial extends ColorsState {}

final class ColorRed extends ColorsState {
  final bool redColor;

  ColorRed({required this.redColor});
}

final class ColorGreen extends ColorsState {
  final bool greenColor;

  ColorGreen({required this.greenColor});
}
