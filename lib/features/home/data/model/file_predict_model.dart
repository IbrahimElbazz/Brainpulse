class FilePredictModel {
  final String prediction;

  FilePredictModel({required this.prediction});

  factory FilePredictModel.fromJson(Map<String, dynamic> json) {
    return FilePredictModel(
      prediction: json['prediction'] ?? 'Unknown',
    );
  }
}
