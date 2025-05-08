import 'dart:io';

abstract class PredictionImageState {}

class InitialPredictionImageState extends PredictionImageState {}

class LoadingPredictionImageState extends PredictionImageState {}

class LoadedPredictionImageState extends PredictionImageState {
  final File image;
  final String label;
  final double confidence;
  LoadedPredictionImageState(
      {required this.label, required this.confidence, required this.image});
}

class ErrorPredictionImageState extends PredictionImageState {
  final String errormsg;
  ErrorPredictionImageState({required this.errormsg});
}
