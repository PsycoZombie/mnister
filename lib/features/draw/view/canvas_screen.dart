import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mnister/features/draw/view/utility_bar.dart';
import 'package:mnister/features/draw/view/canvas.dart';

class CanvasScreen extends ConsumerWidget {
  const CanvasScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,69,0,0),
              child: Canvas(),
            ),
            UtilityBar(),
        ]
      )
    );
  }
}

