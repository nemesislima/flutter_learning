import 'package:flutter/material.dart';
import 'package:flutter_learning/components/task.dart';
import 'package:flutter_learning/data/task_dao.dart';
import 'package:flutter_learning/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController iconController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator (String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator (String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 ||
          int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form (
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView (
            child: Container(
              height: 550,
              width: 350,
              decoration: BoxDecoration(
                color: const Color.fromARGB(250, 245, 163, 186),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da tarefa!!';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome da Tarefa',
                        fillColor: Color.fromARGB(250, 248, 203, 220),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (difficultyValidator(value)) {
                              return 'Insira o nível de dificuldade da tarefa!!';
                            }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade da Tarefa',
                        fillColor: Color.fromARGB(250, 248, 203, 220),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o link do icon da tarefa!!';
                        }
                        return null;
                      },
                      //keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {

                        });
                      },
                      controller: iconController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Icon da Tarefa',
                        fillColor: Color.fromARGB(250, 248, 203, 220),
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration (
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all (
                        width: 6,
                        color: Colors.pink,
                      ),
                    ),
                    child: ClipRRect (
                      borderRadius : BorderRadius.circular(10),
                      child: Image.network(
                        iconController.text,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Image.asset('assets/images/upload.png');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton (
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // print(nameController.text);
                          // print(difficultyController.text);
                          // print(iconController.text);
                          TaskDao().save (
                              Task (
                                nameController.text,
                                iconController.text,
                                int.parse(difficultyController.text),
                              ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Criando nova tarefa...'),
                              ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adicionar nova tarefa')
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
