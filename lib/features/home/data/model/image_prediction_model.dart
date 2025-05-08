class ImagePredictionModel {
  final String label;
  final double confidence;

  ImagePredictionModel({
    required this.label,
    required this.confidence,
  });

  factory ImagePredictionModel.fromJson(Map<String, dynamic> json) {
    return ImagePredictionModel(
      label: json['label'] ?? '',
      confidence: json['confidence'] != null
          ? (json['confidence'] as num).toDouble()
          : 0.0,
    );
  }
}
