import 'package:flutter/material.dart';

class ReatividadeBasica extends StatelessWidget {


  final _couter = 0;
  const ReatividadeBasica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reatividade Básica'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Counter: '),
              const Text('1'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('SOMA + 1'),
              ),
            ],
          ),
        ));
  }
}
