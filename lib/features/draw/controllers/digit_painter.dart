import 'package:flutter/material.dart';
import 'package:mnister/core/constants/constants.dart';

class DigitPainter extends CustomPainter {
  const DigitPainter({required this.grid});
  final List<List<double>> grid;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.square;
    final scaleX = size.width / colSize;
    final scaleY = size.height / rowSize;

    for (int y = 0; y < rowSize; y++) {
      for (int x = 0; x < colSize; x++) {
        final intensity = grid[y][x];
        if (intensity > 0) {
          paint.color = Colors.white.withAlpha(
            (intensity.clamp(0.0, 1.0) * maxIntensity).toInt(),
          );
          canvas.drawRect(
            Rect.fromLTWH(x * scaleX, y * scaleY, scaleX, scaleY),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
