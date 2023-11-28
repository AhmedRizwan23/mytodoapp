import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodoapp/utils/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController newtask = TextEditingController();
  List todolist = [
    ["Make food", false],
    ["Exercise", true],
    ["Read a book", false],
    ["Complete work tasks", true],
    ["Learn Flutter", false],
  ];
  void checkboxchanged(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void deletetask(int index) {
    setState(() {
      todolist.removeAt(index);
      print(todolist);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData().primaryColor,
      appBar: AppBar(
        title: const Text('ToDo'),
        centerTitle: true,
        backgroundColor: ThemeData().appBarTheme.backgroundColor,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, int index) {
          return Todotile(
              deletetask: () {
                deletetask(index);
              },
              onChanged: (value) {
                checkboxchanged(value, index);
              },
              taskcompleted: todolist[index][1],
              taskname: todolist[index][0]);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.bottomSheet(Container(
          color: Colors.grey,
          height: 200,
          width: 700,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                TextFormField(
                  controller: newtask,
                ),
                IconButton(
                    onPressed: () {
                      String task;
                      if (newtask.text != "") {
                        task = newtask.text;
                        setState(() {
                          todolist.add([task, false]);
                        });

                        newtask.clear();
                        print(todolist);
                      }
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
          ),
        ));
      }),
    );
  }
}
