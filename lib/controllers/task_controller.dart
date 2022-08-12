import 'package:flutter_to_do_app/db/db_helper.dart';
import 'package:get/get.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }
  
  Future<int> delete(int? id) async {
    return await DBHelper.delete(id!);
  }

  Future<int> markTaskCompleted(int? id) async {
    return await DBHelper.update(id!);
  }
}