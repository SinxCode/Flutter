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

        //O Row significa linha, serve para colocar os componentes um do lado do outro (horizontal).
        //O primeiro componente sempre ficará mais a esquerda que os demais.
        home: Row(
            children: [
              Container(color: Colors.red, width: 100, height: 100,),
              Container(color: Colors.blue, width: 50, height: 50,),
            ],

        )

    );
  }
}
