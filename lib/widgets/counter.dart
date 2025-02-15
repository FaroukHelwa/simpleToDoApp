// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allTodos;
  final int allCompleted;

  const Counter({Key? key, required this.allCompleted, required this.allTodos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text("$allCompleted/$allTodos",
          style: TextStyle(
              fontSize: 44,
               color: (allCompleted == allTodos && allTodos!=0) ? Color.fromARGB(255, 142, 253, 200) 
                  :( allCompleted== 0 || allTodos== 0 )? Color.fromARGB(255, 226, 89, 89)
                  :  Colors.white, 
               fontWeight: FontWeight.bold)),
    );
  }
}