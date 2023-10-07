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
          leading: Container(),
          //leanding coloca um espaço a esquerda, neste caso utilziamos um espaço de container
          title: Text('Tarefas',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          backgroundColor: Colors.lightBlueAccent,
        ),

        //Um ListView diferente da coluna permite scrollar a imagem
        body: ListView(
          children: [
            Task('Aprender Flutter',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
            Task('Andar de Bike',
                'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg'),
            Task('Meditar',
                'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg'),
            Task('Ler',
                'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg'),
            Task('Jogar','https://s2-techtudo.glbimg.com/VazbHq7he8hqTb19xbgCZP3Wejs=/0x0:1200x800/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/R/q/Vm9IDWRyijHPCBh2iAqg/controle-de-xbox.png')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}

//Digitando stateless e apertando 'tab' toda estrutura abaixo é criada:
//O Stateless cria um widget proprio, que podemos chamar sempre que precisarmos, ele é estático, não muda na tela.
//O Statefull cria um widget proprio, que podemos chamar sempre que necessário, mas ele não é estático, ele permite mudanças na tela.
//É útil para quando precisamos repetir o mesmo layout varias vezes.
//Criando classe de tarefas
class Task extends StatefulWidget {
  final String nome;
  final String foto;

  const Task(this.nome, this.foto, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  //Sempre colocar variaveis antes do override para caso mudarmos o widget elas funcionarem.
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    //O padding adiciona um espaçamento em que os objetos terão entre si
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column( mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: TextStyle(fontSize: 24),
                                //O Overflow no texto, serve para dizermos o que irá acontecer, caso o texto passe do tamanho
                                //estabelecido (neste caso pelo container de 200). Neste caso a elpises seria reticencias
                                overflow: TextOverflow.ellipsis,
                              )),
                          Row(
                            children: [
                              Icon(Icons.star, size: 15, color: Colors.blue,),
                              Icon(Icons.star, size: 15, color: Colors.blue,),
                              Icon(Icons.star, size: 15, color: Colors.blue[100],),
                              Icon(Icons.star, size: 15, color: Colors.blue[100],),
                              Icon(Icons.star, size: 15, color: Colors.blue[100],),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 72,
                        width: 80,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                              print(nivel);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up, color: Colors.white),
                                Text(
                                  'UP',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                )
                              ],
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.lightBlueAccent))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.black12,
                          color: Colors.white,
                          value: nivel / 10,
                        ),
                        width: 200,
                      ),
                      Text(
                        'Nivel $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
