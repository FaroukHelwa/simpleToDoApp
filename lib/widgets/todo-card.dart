// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Todecard extends StatelessWidget {
  final String varTitle;
  final bool doneOrNot;
  final Function myFunc;
  final int taskIndex;
  final Function delete;

  const Todecard(
      {super.key,
      required this.varTitle,
      required this.doneOrNot,
      required this.myFunc,
      required this.taskIndex,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myFunc(taskIndex);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                varTitle,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Row(children: [
                Icon(
                  doneOrNot ? Icons.check : Icons.close,
                  size: 27,
                  color: doneOrNot ? Colors.green : Colors.red,
                ),
                SizedBox(
                  width: 22,
                ),
                IconButton(
                  onPressed: () {
                    delete(taskIndex);
                  },
                  icon: Icon(Icons.delete),
                  iconSize: 27,
                  color: const Color.fromARGB(255, 230, 214, 213),
                )
              ])
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2),
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
    );
  }
}
