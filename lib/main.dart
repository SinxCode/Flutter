import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/Screens/Initial_Screen.dart';
import 'package:meu_primeiro_projeto/Screens/form_screen.dart';

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
      home: const InitialScreen(),
    );
  }
}






