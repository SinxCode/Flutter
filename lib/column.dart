import 'package:flutter/material.dart';

//Função principal de um projeto Flutter
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      //O parametro Children diz que o os filhos da classe ficam juntos, no caso do colum um ao lado do outro
        //O Column significa Coluna, serve para colocar os componentes um do lado do outro (vertical).
        //O primeiro componente sempre ficará mais acima que os demais.
      home: Column(

        //eixo principal de alinhamento
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        //eixo de principal de cruzamento
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //no column o primeiro container sempre estará no topo
          Container(color: Colors.red, width: 100, height: 100,),
          Container(color: Colors.blue, width: 50, height: 50,),
        ],

      )

    );
  }
}
