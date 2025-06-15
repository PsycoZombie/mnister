import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mnister/core/tflite/tflite_service.dart';
import 'package:mnister/providers/image_grid_provider.dart';
import 'package:mnister/providers/prediction_provider.dart';

Future predict(WidgetRef ref) async {
  final predictionNotifier = ref.read(predictionProvider.notifier);
  final gridNotifier = ref.read(imageGridProvider.notifier);
  final tfliteService = TFLiteService();
  final imageGridMatrix = gridNotifier.imageGridAsMatrix;
  await tfliteService.init();
  final isBlank = imageGridMatrix.every(
    (row) => row.every((pixel) => pixel == 0.0),
  );
  if (isBlank) return;
  final prediction = await tfliteService.runInference(imageGridMatrix);
  predictionNotifier.setPrediction(prediction);
  gridNotifier.printImage();
}

void clearGrid(WidgetRef ref) {
  final gridNotifier = ref.read(imageGridProvider.notifier);
  final predictionNotifier = ref.read(predictionProvider.notifier);
  gridNotifier.clearGrid();
  predictionNotifier.setPrediction(-1);
}
