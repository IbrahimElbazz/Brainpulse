import 'dart:io';

abstract class PredictionImageState {}

class InitialPredictionImageState extends PredictionImageState {}

class LoadingPredictionImageState extends PredictionImageState {}

class LoadedPredictionImageState extends PredictionImageState {
  final File image;
  final double gpd;
  final double grda;
  final double lpd;
  final double lrda;
  final double seizure;
  final double other;
  LoadedPredictionImageState({
    required this.image,
    required this.gpd,
    required this.grda,
    required this.lpd,
    required this.lrda,
    required this.seizure,
    required this.other,
  });
}

class ErrorPredictionImageState extends PredictionImageState {
  final String errormsg;
  ErrorPredictionImageState({required this.errormsg});
}

