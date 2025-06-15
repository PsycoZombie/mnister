import 'package:tflite_flutter/tflite_flutter.dart';

class TFLiteService {
  late Interpreter _interpreter;

  Future<void> init() async {
    _interpreter = await Interpreter.fromAsset(
      'assets/models/mnist_cnn_model.tflite',
    );
  }

  Future<int> runInference(List<List<double>> grid) async {
    final input = [
      grid.map((row) => row.map((val) => val.toDouble()).toList()).toList(),
    ];
    final input4D = input
        .map(
          (image) =>
              image.map((row) => row.map((pixel) => [pixel]).toList()).toList(),
        )
        .toList();
    final output = List.filled(1 * 10, 0.0).reshape([1, 10]);

    _interpreter.run(input4D, output);
    print(output);

    return output[0]
        .asMap()
        .entries
        .reduce(
          (MapEntry<int, double> a, MapEntry<int, double> b) =>
              a.value > b.value ? a : b,
        )
        .key;
  }

  void close() {
    _interpreter.close();
  }
}
