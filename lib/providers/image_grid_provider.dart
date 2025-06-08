import 'package:mnister/core/constants/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_grid_provider.g.dart';

@riverpod
class ImageGrid extends _$ImageGrid {
  @override
  List<List<double>> build() {
    return List.generate(rowSize, (_) => List.filled(colSize, 0.0));
  }

  List<List<double>> get imageGridAsMatrix => state;

  void updateGrid(List<List<double>> grid) {
    state = grid.map((row) => [...row]).toList();
  }

  set imageGrid(List<List<double>> grid) => state = grid;

  List<int> get imageGridAsArray {
    return state
        .expand((List<double> row) => row)
        .map((double value) => (value * maxIntensity).toInt())
        .toList();
  }

  void printImage() {
  for (final row in imageGridAsMatrix) {
    final line = row
        .map((value) => (value * 255).toInt().toString().padLeft(3))
        .join('');
    print(line);
  }
}


  void clearGrid() {
    state = List.generate(rowSize, (_) => List.filled(colSize, 0.0));
  }
}
