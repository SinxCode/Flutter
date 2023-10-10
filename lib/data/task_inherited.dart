import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/components/Task.dart';

//apertando inh ele cria a o inheritedwidget automaticamente
class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  //criando lista de tarefas
  final List<Task> taskList = [
    //armazenando as tarefas default dentro do inherited
    Task('Aprender Flutter', 'assets/images/flutter.png', 3),
    Task('Andar de Bike', 'assets/images/bike.jpg', 2),
    Task('Meditar', 'assets/images/meditar.jpeg', 5),
    Task('Ler', 'assets/images/livro.jpg', 4),
    Task('Jogar', 'assets/images/jogar.webp', 1),
  ];

  //criando função para adicionar novas tarefas a nossa lista
  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    //verificando se a lista no estado anterior usando o old está diferente ou igual a lista atual
    return old.taskList.length != taskList.length;
  }
}
