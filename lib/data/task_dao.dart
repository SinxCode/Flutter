import 'package:meu_primeiro_projeto/components/Task.dart';
import 'package:meu_primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  //criando tabela sql do projeto
  //colocando nome da tabela como varíavel para ficar mais fácil de mudar se quisermos futuramente

  static const String tableSql =
      'CREATE TABLE $_tablename(' //static significa que ela vai ter o mesmo valor pra qualquer instancia de objeto
      //criado com a classe TaskDao
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

//aplicando nome para as variáveis
  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {}

  //Método para buscar todas as tarefas
  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  //Método para transformar um mapa em uma lista, pois o banco armazena em mapa
  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List:');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  //Método para ler uma tarefa única
  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando Find');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {}
}
