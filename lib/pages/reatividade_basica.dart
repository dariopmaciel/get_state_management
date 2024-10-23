import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReatividadeBasica extends StatelessWidget {
  final _couter = 0.obs;

  ReatividadeBasica({super.key});

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
              Obx(() {
                return Text('Counter: ${_couter.value}');
              }),
              ElevatedButton(
                onPressed: () {
                  _couter.value++;
                },
                child: const Text('SOMA + 1'),
              ),
            ],
          ),
        ));
  }
}
