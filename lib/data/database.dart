import 'package:meu_primeiro_projeto/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; //Pacote para encontrar um local no dispositivo para manipular arquivos


Future<Database> getDatabase() async {  //Utilizando future, pois quando utilizamos uma extensão fora do Flutter
                                        //o projeto não pode ficar trava até a informação chegar, e o future nos ajuda com isso.

  final String path = join(await getDatabasesPath(), 'task.db'); //criando um 'caminho' para abrir o banco de dados

  return openDatabase(path, onCreate: (db, version) { //caso o banco de dados não existe, será criado, executando uma tabela.
    db.execute(TaskDao.tableSql);
  }, version: 1,);
}
