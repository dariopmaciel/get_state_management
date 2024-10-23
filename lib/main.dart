import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_management/home_page.dart';
import 'package:get_state_management/pages/basico/reatividade_basica.dart';
import 'package:get_state_management/pages/tipos/tipos_reativos_genericos_nulos_page.dart';
import 'package:get_state_management/pages/tipos/tipos_reativos_genericos_page.dart';
import 'package:get_state_management/pages/tipos/tipos_reativos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.blue,
        useMaterial3: false,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/basico', page: () => ReatividadeBasica()),
        GetPage(name: '/tiposReativos', page: () => TiposReativosPage()),
        GetPage(name: '/tiposReativosGenericos', page: () => TiposReativosGenericosPage()),
        GetPage(name: '/tiposReativosGenericosNulos', page: () => TiposReativosGenericosNuloPage()),
      ],
    );
  }
}
