import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/Screens/form_screen.dart';
import 'package:meu_primeiro_projeto/components/Task.dart';
import 'package:meu_primeiro_projeto/data/task_dao.dart';
import 'package:meu_primeiro_projeto/data/task_inherited.dart';

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
        actions: [
          IconButton(onPressed: (){setState(() {

          });}, icon: Icon(Icons.refresh))
        ],
        //leanding coloca um espaço a esquerda, neste caso utilziamos um espaço de container
        title: const Text('Tarefas',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        backgroundColor: Colors.lightBlueAccent,
      ),

      //Um ListView diferente da coluna permite scrollar a imagem
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),

        //Criando a tela baseada na lista de tarefas pega pelo banco de dados
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;

                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            'Não Há nenhuma Tarefa!',
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    );
                  }
                  return Text('Erro ao carregar Tarefas');
                  break;
              }
              return Text('Erro desconhecido');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Função para mudar de tela
          Navigator.push(
            context,
            MaterialPageRoute(
                //chamando esse builder de contextNew para não dar problema
                builder: (contextNew) => FormScreen(
                      taskContext: context,
                    )),
          ).then((value) => setState((){print('Recarregando tela');}));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
