import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mnister/core/constants/constants.dart';
import 'package:mnister/features/draw/controllers/digit_painter.dart';
import 'package:mnister/features/draw/controllers/utility_functions.dart';
import 'package:mnister/providers/image_grid_provider.dart';

class Canvas extends ConsumerWidget {
  const Canvas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grid = ref.watch(imageGridProvider);
    final gridNotifier = ref.read(imageGridProvider.notifier);

    return SizedBox(
      height: canvasHeight,
      width: canvasWidth,
      child: Container(
        padding: const EdgeInsets.all(3),
        color: Colors.black,
        child: GestureDetector(
          onPanUpdate: (details) {
            final updatedGrid = onPanUpdate(details, grid.map((row) => [...row]).toList()); 
            gridNotifier.updateGrid(updatedGrid);
          },
          child: CustomPaint(
            painter: DigitPainter(grid: grid),
          ),
        ),
      ),
    );
  }
}

