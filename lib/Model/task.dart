import 'dart:convert';

import 'package:flutter/services.dart';

class Task {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Task({
    this.userId,
    this.id,
    this.title,
    this.completed
  });

  Task.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }

  static Future<String> _loadTaskAsset() async {
    return await rootBundle.loadString('asset/tasks.json');
  }

  static Future<List<Task>> loadTasks() async {
    String jsonString = await _loadTaskAsset();
    List<dynamic> jsonResponse = jsonDecode(jsonString) as List;
    List<Task> rep=[];
    jsonResponse.forEach((element) {
      rep.add(Task.fromJson(element));
    });
    return rep;
  }
}