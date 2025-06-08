import 'package:brain_pulse/features/home/data/repo/predict_image_repo_imple.dart';
import 'package:brain_pulse/features/home/presentation/controller/cubit/prediction_image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

class PredictionImageCubit extends Cubit<PredictionImageState> {
  final PredictImageRepoImple predictImageRepoImple;

  PredictionImageCubit({required this.predictImageRepoImple})
      : super(InitialPredictionImageState());

  Future<void> uploadImage(File image) async {
    emit(LoadingPredictionImageState());
    final result = await predictImageRepoImple.postimage(image: image);

    result.fold(
      (error) => emit(ErrorPredictionImageState(errormsg: error)),
      (predictionModel) => emit(
        LoadedPredictionImageState(
          image: image,
          gpd: predictionModel.gpd,
          grda: predictionModel.grda,
          lpd: predictionModel.lpd,
          lrda: predictionModel.lrda,
          seizure: predictionModel.seizure,
          other: predictionModel.other,
        ),
      ),
    );
  }
}
