import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text("go to canvas scren"),
                onPressed: (){context.push('/canvas');},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
