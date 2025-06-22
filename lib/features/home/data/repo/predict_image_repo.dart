import 'dart:io';
import 'package:brain_pulse/features/home/data/model/image_prediction_model.dart';
import 'package:dartz/dartz.dart';

abstract class PredictImageRepo {
  Future<Either<String, ImagePredictionModel>> postimage({required File image});
}

