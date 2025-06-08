import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mnister/core/tflite/tflite_service.dart';
import 'package:mnister/providers/image_grid_provider.dart';
import 'package:mnister/providers/prediction_provider.dart';

Future<int> predict(WidgetRef ref) async {
  final gridNotifier = ref.read(imageGridProvider.notifier);
  final tfliteService = TFLiteService();
  await tfliteService.init();
  final imageGridMatrix = gridNotifier.imageGridAsMatrix;
  final prediction = await tfliteService.runInference(imageGridMatrix);
  print('Predicted digit: $prediction');
  gridNotifier.printImage();
  ref.read(predictionProvider.notifier).setPrediction(prediction);
  return prediction;
}

void clearGrid(WidgetRef ref){
  final gridNotifier = ref.read(imageGridProvider.notifier);
  gridNotifier.clearGrid();
}