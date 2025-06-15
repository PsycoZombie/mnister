import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mnister/features/draw/repository/tflite_repo.dart';
import 'package:mnister/providers/prediction_provider.dart';

class UtilityBar extends ConsumerWidget {
  const UtilityBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prediction = ref.watch(predictionProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                clearGrid(ref);
              },
              child: Text('Clear'),
            ),
            ElevatedButton(
              child: Text('Predict'),
              onPressed: () async {
                predict(ref);
              },
            ),
          ],
        ),
        Text(
          prediction == -1 ? 'Draw to predict ' : "Predicted $prediction?",
          style: TextStyle(fontSize: 21, color: Colors.red),
        ),
      ],
    );
  }
}
