import 'package:flutter/material.dart';
import 'package:flutter_learning/components/task.dart';
import 'package:flutter_learning/data/task_dao.dart';
import 'package:flutter_learning/data/task_inherited.dart';
import 'package:flutter_learning/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});



  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  //bool opacidade = true;
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          color: Colors.pink,
        ),
        actions: [
          IconButton (
              onPressed: () {
                setState( () {} );
              } ,
              icon: Icon (Icons.refresh),
          ),
        ],
        title: const Text('Controle de autocuidado'),
      ),
      body: Padding (
        padding: const EdgeInsets.only(top: 20, bottom: 70),
        child: FutureBuilder<List<Task>>(future: TaskDao().findAll() , builder: (context, snapshot) {
          List<Task>? items = snapshot.data;
          switch (snapshot.connectionState) {

            case ConnectionState.none:

              return Center (
                child: Column (
                  children: [
                    CircularProgressIndicator(),
                    Text ('Carregando..'),
                  ],
                ),
              );

              break;

            case ConnectionState.waiting:

              return Center (
                child: Column (
                  children: [
                    CircularProgressIndicator(),
                    Text ('Carregando..'),
                  ],
                ),
              );


              break;

            case ConnectionState.active:

              return Center (
                child: Column (
                  children: [
                    CircularProgressIndicator(),
                    Text ('Carregando..'),
                  ],
                ),
              );


              break;

            case ConnectionState.done:
              if (snapshot.hasData && items != null) {
                if (items.isNotEmpty) {
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Task tarefa = items [index];
                      return tarefa;
                    },
                  );
                }
                return Center (
                  child: Column (
                    children: [
                      Icon (
                        Icons.error_outline,
                        size: 128,
                      ),
                      Text (
                        'Não há nenhuma tarefa!',
                        style: TextStyle (
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Text ('Erro ao carregar tarefas');

              break;
          }
          
          return Text ('Erro desconhecido!');
          
        }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
          //setState(() {
            //opacidade = !opacidade;
          //});
            Navigator.push (
                context, MaterialPageRoute (
                  builder: (contextNew) => FormScreen(taskContext: context),
                ),
            ).then((value) => setState ( () {} ) );
          },
          backgroundColor: Colors.pink,
          child: const Icon(
            Icons.add,
          //Icons.remove_red_eye,
          ),
        ),
    );
  }}