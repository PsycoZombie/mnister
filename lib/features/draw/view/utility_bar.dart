import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mnister/features/draw/repository/tflite_repo.dart';
import 'package:mnister/providers/prediction_provider.dart';

class UtilityBar extends ConsumerWidget {
  const UtilityBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prediction = ref.watch(predictionProvider);
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            clearGrid(ref);
          },
          child: Text('clear'),
        ),
        ElevatedButton(
          child: Text('predict'),
          onPressed: () async {
            predict(ref);
          },
        ),
        Text(
          prediction == -1 ? 'draw to predict ' : "predicted $prediction?",
        ),
      ],
    );
  }
}
