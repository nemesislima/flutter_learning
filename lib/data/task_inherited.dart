import 'package:flutter/material.dart';
import 'package:flutter_learning/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task("Acordei no horário",
        'assets/images/sono.png', 4),
    Task("Realizei as 3 refeições",
        'assets/images/comida.png', 3),
    Task("Fui à academia",
        'assets/images/academia.png', 5),
    Task("Meditei",
        'assets/images/meditar.png', 3),
    Task("Estudei",
        'assets/images/estudos.png', 2),
    Task(
        "Economizei",
        'assets/images/economia.png',
        4),
    Task("Trabalhei",
        'assets/images/trabalho.png', 2),
    Task("Fui à terapia",
        'assets/images/terapia.png', 2),
  ];

  void newTask (String name, String photo, int difficulty) {
    taskList.add(
      Task(name, photo, difficulty),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
