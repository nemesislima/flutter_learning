import 'package:flutter/material.dart';
import 'package:flutter_learning/data/task_inherited.dart';
import 'package:flutter_learning/screens/form_screen.dart';
import 'package:flutter_learning/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: TaskInherited(
          child: const InitialScreen(),
      ),

    );
  }
}





