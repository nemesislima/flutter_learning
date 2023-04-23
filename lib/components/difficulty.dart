import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;

  const Difficulty({
    required this.difficultyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 15,
            color: (difficultyLevel >= 1)
                ? const Color.fromARGB(250, 138, 59, 92)
                : const Color.fromARGB(250, 246, 179, 203)),
        Icon(Icons.star,
            size: 15,
            color: (difficultyLevel >= 2)
                ? const Color.fromARGB(250, 138, 59, 92)
                : const Color.fromARGB(250, 246, 179, 203)),
        Icon(Icons.star,
            size: 15,
            color: (difficultyLevel >= 3)
                ? const Color.fromARGB(250, 138, 59, 92)
                : const Color.fromARGB(250, 246, 179, 203)),
        Icon(Icons.star,
            size: 15,
            color: (difficultyLevel >= 4)
                ? const Color.fromARGB(250, 138, 59, 92)
                : const Color.fromARGB(250, 246, 179, 203)),
        Icon(Icons.star,
            size: 15,
            color: (difficultyLevel >= 5)
                ? const Color.fromARGB(250, 138, 59, 92)
                : const Color.fromARGB(250, 246, 179, 203)),
      ],
    );
  }
}
