import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        // center entire body
        child: Stack(
          alignment: Alignment.center, // center children in stack
          children: [
            Image.asset(
              'assets/silly_logo.webp', // make sure the path is correct
              width: 500,
              height: 500,
            ),
            OutlinedButton(
              onPressed: () {
                context.push('/canvas');
              },
              child: const Text(
                "Go to Canvas Screen",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
