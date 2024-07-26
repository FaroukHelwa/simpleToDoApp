// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';
import 'package:todoapp/widgets/counter.dart';

import 'widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TodoApp(),
    );
  }
}

class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List allTasks = [];

  delete(int index) {
    setState(() {
      allTasks.remove(allTasks[index]);
    });
  }

  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  changeStatus(int index) {
    setState(() {
      allTasks[index].status = !allTasks[index].status;
    });
  }

  addNewTask() {
    setState(() {
      allTasks.add(Task(title: myController.text, status: false));
    });
  }

  final myController = TextEditingController();

  int calculateCompletedTasks() {
    int completedTasks = 0;
    allTasks.forEach((item) {
      if (item.status) {
        completedTasks++;
      }
    });
    return completedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    padding: EdgeInsets.all(22),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                            controller: myController,
                            maxLength: 20,
                            decoration:
                                InputDecoration(hintText: "Add new Task")),
                        SizedBox(
                          height: 22,
                        ),
                        TextButton(
                            onPressed: () {
                              addNewTask();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.blue),
                            ))
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: Icon(Icons.delete_forever),
              iconSize: 32,
              color: const Color.fromARGB(255, 212, 72, 62),
            )
          ],
          elevation: 0,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1),
          title: Text(
            "TO DO APP",
            style: TextStyle(
                fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Counter(
                  allTodos: allTasks.length,
                  allCompleted: calculateCompletedTasks()),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 480,
                child: ListView.builder(
                    itemCount: allTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Todecard(
                        varTitle: allTasks[index].title,
                        doneOrNot: allTasks[index].status,
                        myFunc: changeStatus,
                        taskIndex: index,
                        delete: delete,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
