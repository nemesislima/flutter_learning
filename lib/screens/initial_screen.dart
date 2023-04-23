import 'package:flutter/material.dart';
import 'package:flutter_learning/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});



  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          color: Colors.pink,
        ),
        title: const Text('Controle de autocuidado'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //scrollDirection: Axis.vertical,
          children: const [
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.remove_red_eye,
        ),
      ),
    );
  }}