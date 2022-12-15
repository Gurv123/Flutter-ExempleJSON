import 'package:flutter/material.dart';

import '../Model/task.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a task"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, Task.fakeTask());
          },
          child: const Text("Fake task"),
        ),
      ),
    );
  }
}