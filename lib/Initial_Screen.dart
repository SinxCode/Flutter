
import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/Task.dart';

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
        title: Text('Tarefas',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        backgroundColor: Colors.lightBlueAccent,
      ),

      //Um ListView diferente da coluna permite scrollar a imagem
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          children: [
            Task(
                'Aprender Flutter',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3),
            Task(
                'Andar de Bike',
                'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
                2),
            Task(
                'Meditar',
                'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                5),
            Task(
                'Ler',
                'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                4),
            Task(
                'Jogar',
                'https://s2-techtudo.glbimg.com/VazbHq7he8hqTb19xbgCZP3Wejs=/0x0:1200x800/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/R/q/Vm9IDWRyijHPCBh2iAqg/controle-de-xbox.png',
                1)
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
