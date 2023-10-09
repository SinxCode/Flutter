
import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/components/Task.dart';

//Digitando stl e apertando 'tab' toda estrutura abaixo é criada:
//O Stateless cria um widget proprio, que podemos chamar sempre que precisarmos, ele é estático, não muda na tela.
//O Statefull cria um widget proprio, que podemos chamar sempre que necessário, mas ele não é estático, ele permite mudanças na tela.
//É útil para quando precisamos repetir o mesmo layout varias vezes.
//Criando classe de tarefas


class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        //leanding coloca um espaço a esquerda, neste caso utilziamos um espaço de container
        title: const Text('Tarefas',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        backgroundColor: Colors.lightBlueAccent,
      ),

      //Um ListView diferente da coluna permite scrollar a imagem
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/flutter.png',
                3),
            Task(
                'Andar de Bike',
                'assets/images/bike.jpg',
                2),
            Task(
                'Meditar',
                'assets/images/meditar.jpeg',
                5),
            Task(
                'Ler',
                'assets/images/livro.jpg',
                4),
            Task(
                'Jogar',
                'assets/images/jogar.webp',
                1),
            SizedBox(height: 80,)//Serve para criarmos espaços
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });

        },
        child: Icon(Icons.remove_red_eye,
          color: Colors.white,),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
