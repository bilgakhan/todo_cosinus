import 'package:flutter/material.dart';
import 'package:todo_app/db/task_db_service.dart';

class GetTaskProvider extends ChangeNotifier {
  GetTaskProvider() {
    getDataDb();
  }

  TaskDb taskDb = TaskDb();
  bool isLoading = false;
  List success = [];
  String error = '';

  Future<void> getDataDb() async {
    isLoading = true;
    notifyListeners();
    dynamic response = await taskDb.getData();
    if (response is List) {
      isLoading = false;
      success = response;
      notifyListeners();
    } else {
      isLoading = false;
      error = response;
      notifyListeners();
    }
  }
}
