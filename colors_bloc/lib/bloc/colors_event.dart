part of 'colors_bloc.dart';

@immutable
sealed class ColorsEvent {}

class ToRedColor extends ColorsEvent {}

class ToGreenColor extends ColorsEvent {}
