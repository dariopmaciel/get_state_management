import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TiposReativosGenericosPage extends StatelessWidget {
  // IGUAL A // final nome = 'Dario'.obs;
  // final nome = RxString('Dario');
  //! >>>>>>>>>>>GENERICO<<<<<<<<<<<<<<<<<<<<<<<<<
  final nome = Rx<String>('Dario');

  // IGUAL A // final isAluno = true.obs;
  // final isAluno = RxBool(true);
  //! >>>>>>>>>>>GENERICO<<<<<<<<<<<<<<<<<<<<<<<<<
  final isAluno = Rx<bool>(true);

  // IGUAL A // final qtdCurso = 1.obs;
  // final qtdCurso = RxInt(1);
  //! >>>>>>>>>>>GENERICO<<<<<<<<<<<<<<<<<<<<<<<<<
  final qtdCurso = Rx<int>(1);

  // IGUAL A // final valorCurso = 1250.obs;
  // final valorCurso = RxDouble(1250);
  //! >>>>>>>>>>>GENERICO<<<<<<<<<<<<<<<<<<<<<<<<<
  final valorCurso = Rx<double>(1250);

  // IGUAL A // final jornadas = [
  //   'Jornada Dart',
  //   'Jornada Flutter',
  //   'Jornada GetX',
  //   'Jornada BackEnd',
  // ].obs;
  // final jornadas = RxList([
  //   'Jornada Dart',
  //   'Jornada Flutter',
  //   'Jornada GetX',
  //   'Jornada BackEnd',
  // ]);
  //! >>>>>>>>>>>GENERICO<<<<<<<<<<<<<<<<<<<<<<<<<
  final jornadas = Rx<List<String>>([
    'Jornada Dart',
    'Jornada Flutter',
    'Jornada GetX',
    'Jornada BackEnd',
  ]);

  // IGUAL A //final aluno = {
  //   'id': 0001,
  //   'nasc': 1984,
  //   'nome': 'Dario',
  //   'sexo': 'MASC',
  // }.obs;
  // final aluno = RxMap({
  //   'id': 0001,
  //   'nome': 'Dario',
  //   'nasc': 1984,
  //   'sexo': 'MASC',
  // });
//! >>>>>>>>>>>GENERICO<<<<<<<<<<<<<<<<<<<<<<<<< ADD TIPO DE VARIAVEL DO MAPA
  final aluno = Rx<Map<String, dynamic>>({
    'id': 0001,
    'nome': 'Dario',
    'nasc': 1984,
    'sexo': 'MASC',
  });

  TiposReativosGenericosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos Reativos Genericos Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //todo mundo dentro do mapa sera rebuildado
            // Obx(() => Text('Id do aluno ${aluno['id']}')),
            Obx(() {
              debugPrint('>>> Montando ID do aluno');

              //!>>>>>>>>>>>>>>> RECUPERAÇÃO DO GENERICO
              return Text('Id do aluno ${aluno.value['id']}');
            }),
            //!>>>>>>>>>>>>>>> RECUPERAÇÃO DO GENERICO
            Text('Nome do aluno ${aluno.value['nome']}'),
            // Column(children: []), //!Não tem lista dentro pois o 'jornadas' já é uma lista
            //!>>>>>>>>>>>>>>> RECUPERAÇÃO DO GENERICO
            Obx(
              () => Column(
                children: jornadas.value.map(Text.new).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                aluno.value['id'] = 10;
                //! NECESSÁRIO REFRESH PARA ATUALIZAR 
                aluno.refresh();
              },
              child: const Text("Alterar ID"),
            ),
            ElevatedButton(
              onPressed: () {
                // jornadas.add('Jornada Lógica');
                //!ZERA a LISTA e add o ultomo item 'Jornada Lógica'
                jornadas.value.assign('Jornada Lógica');
                //! NECESSÁRIO REFRESH PARA ATUALIZAR
                jornadas.refresh();
              },
              child: const Text("Adicionar Jornada"),
            ),
          ],
        ),
      ),
    );
  }
}
