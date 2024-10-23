import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed('/basico');
            },
            child: const Text("Basico Reatividade"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/tiposReativos');
            },
            child: const Text("Tipos Reativos"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/tiposReativosGenericos');
            },
            child: const Text("Tipos Reativos Genericos"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/tiposReativosGenericosNulos');
            },
            child: const Text("Tipos Reativos Genericos Nulos"),
          ),
        ],
      )),
    );
  }
}
