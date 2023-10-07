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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter: Meus primeiros passos',
              style: TextStyle(color: Colors.white,fontSize: 24)), backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(color: Colors.white,),

        floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: Colors.lightBlueAccent,),
      ),

    );
  }
}
