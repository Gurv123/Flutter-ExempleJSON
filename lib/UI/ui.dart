import 'package:flutter/material.dart';
import '../Model/task.dart';
import 'addTask.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Task> taskList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todolist"),
        actions: [
          IconButton(
            onPressed: () => _downloadList(),
            icon: const Icon(Icons.file_download),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              height: 100,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.only(left: 10),
              child:
              Card(
                color: Colors.lightGreen,
                child:
                ListTile(
                    leading: Text("Id : ${taskList[index].id}"
                    ),
                    title: Text(taskList[index].title),
                    trailing: taskList[index].completed?
                      const Icon(Icons.check, color: Colors.amberAccent):
                      const Icon(Icons.close, color: Colors.amberAccent),
                ),
              ),
            ),
            onTap: () => debugPrint("click ${taskList[index].title}"),
          );
        }
      )
    );
  }


  _downloadList() {
    Task.loadTasks().then((value) {
      setState(() {
        value.forEach((element) {
          taskList.add(element);
        });
      });
    });
  }

  _addTask(BuildContext buildContext) async {
    final newTask = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()));
    setState(() {
      taskList.add(newTask);
    });
  }
}