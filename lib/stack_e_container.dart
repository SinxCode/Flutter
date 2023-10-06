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

      //Stack - Funciona como uma pilha, onde podemos empilhar coisas com o 'children' (bem literal, uma em cima da outra, não é possível colocar 2 containers um do lado do outro por exemplo)
      home: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          //Container basicamente é uma forma (se não definir o tamanho, ele toma a tela inteira) que vc define cor, tamanho e outros parametros.
          Container(color: Colors.white, width: 400, height: 400,),
          Container(color: Colors.black, width: 330, height: 330,),
          Container(color: Colors.red, width: 170, height: 170,),
          Container(color: Colors.blueAccent, width:90, height: 90,),
          Container(color: Colors.amber, width: 40, height: 40,)

        ],
      ),
    );
  }
}
