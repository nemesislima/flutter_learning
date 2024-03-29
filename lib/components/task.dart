import 'package:flutter/material.dart';
import 'package:flutter_learning/components/difficulty.dart';
import 'package:flutter_learning/data/task_dao.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String nome;
  final String imagem;
  final int dificuldade;

  Task(this.nome, this.imagem, this.dificuldade, {super.key});

    int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNetwork () {
    if (widget.imagem.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    //int nivel = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            //color: Color.fromARGB(250, 246, 179, 203),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(250, 180, 104, 133)),
                height: 140,
            ),
          Column(
            children: [
              Container(
                //color: Color.fromARGB(250, 245, 202, 217),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(250, 227, 116, 156)),
                    height: 100,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(
                      //color: Color.fromARGB(250, 150, 15, 65),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all (
                            width: 6,
                            color: const Color.fromARGB(250, 150, 15, 65),
                          ),
                          color: const Color.fromARGB(250, 150, 15, 65)),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: assetOrNetwork() ? Image.asset(
                            widget.imagem,
                          //fit: BoxFit.cover,
                        ) : Image.network(
                            widget.imagem,
                        )
                      ),
                    ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Difficulty(
                            difficultyLevel: widget.dificuldade,),
                        ],
                    ),
                    SizedBox(
                      width: 52,
                      height: 52,
                      child: ElevatedButton(
                          onLongPress: () {
                            TaskDao().delete(widget.nome);
                          },
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                            //print(nivel);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(
                                Icons.arrow_drop_up,
                              ),
                              Text(
                                'Up',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Nível: ${widget.nivel}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}