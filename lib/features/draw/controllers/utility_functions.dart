import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:mnister/core/constants/constants.dart';

List<List<double>> onPanUpdate(
  DragUpdateDetails details,
  List<List<double>> grid,
) {
  final localPosition = details.localPosition;
  final x = (localPosition.dx ~/ cellWidth).clamp(0, colSize - 1);
  final y = (localPosition.dy ~/ cellHeight).clamp(0, rowSize - 1);

  grid[y][x] = 1;
  applyBrush(grid, x, y, falloffRadius, falloffSigma);
  return grid;
}

void applyBrush(
  List<List<double>> grid,
  int centerX,
  int centerY,
  double radius,
  double sigma,
) {
  final int startX = (centerX - radius).floor().clamp(0, 27);
  final int endX = (centerX + radius).ceil().clamp(0, 27);
  final int startY = (centerY - radius).floor().clamp(0, 27);
  final int endY = (centerY + radius).ceil().clamp(0, 27);

  for (int y = startY; y <= endY; y++) {
    for (int x = startX; x <= endX; x++) {
      final dx = x - centerX;
      final dy = y - centerY;
      final distance = math.sqrt(dx * dx + dy * dy);

      if (distance <= radius) {
        final intensity = gaussianFalloff(distance, sigma);
        // Add intensity but cap at 1.0
        grid[y][x] = (grid[y][x] + intensity).clamp(0.0, 1.0);
      }
    }
  }
}

gaussianFalloff(double distance, double sigma) {
  return math.exp(-(distance * distance) / (2 * sigma * sigma));
}
