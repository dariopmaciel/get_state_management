import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_management/home_page.dart';
import 'package:get_state_management/pages/atualiza%C3%A7%C3%A3o/atualizacao_objetos_page.dart';
import 'package:get_state_management/pages/basico/reatividade_basica.dart';
import 'package:get_state_management/pages/controllers/controllers_home_page.dart';
import 'package:get_state_management/pages/controllers/getxcontroller_example/controller.dart';
import 'package:get_state_management/pages/controllers/getxcontroller_example/getx_controller_example_page.dart';
import 'package:get_state_management/pages/tipos/tipos_obs_page.dart';
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
        GetPage(
            name: '/tiposReativosGenericos',
            page: () => TiposReativosGenericosPage()),
        GetPage(
            name: '/tiposReativosGenericosNulos',
            page: () => TiposReativosGenericosNuloPage()),
        GetPage(name: '/tiposObs', page: () => TiposObsPage()),
        GetPage(name: '/atualizacao', page: () => AtualizacaoObjetosPage()),
        GetPage(
            name: '/controllers',
            page: () => const ControllersHomePage(),
            children: [
              GetPage(
                  name: '/getxcontroller',
                  //!atenção: se usar este de baixo não estará 100% ligada a CONTROLLER
                  //!vai ser inicializado SOMENTE quando for chamado pela PRIMEIRA vez
                  //! e altera o ciclo de vida => Comentar o item 'Obx(() => Text(Get.find<Controller>().nome.value)),' do getx_controller_example_page
                  // binding: BindingsBuilder(() {
                  //   Get.lazyPut(() => Controller());
                  // }),
                  //*correto
                  //para fazer um reload não se pode usar PUT pois ele instancia na hora, por isto usar lazyput
                  // binding: BindingsBuilder.put(() => Controller()),
                  binding:
                      BindingsBuilder(() => Get.lazyPut(() => Controller())),
                  page: () => const GetxControllerExamplePage()),
            ]),
      ],
    );
  }
}
