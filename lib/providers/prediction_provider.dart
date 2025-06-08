import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'prediction_provider.g.dart';

@riverpod
class Prediction extends _$Prediction {
  @override
  int build() => -1;

  void setPrediction(int value) => state = value;
}
