import 'package:flutter/material.dart';
import 'package:todo_app/db/task_db_service.dart';

class AddDataProvider extends ChangeNotifier {
  AddDataProvider() {
    addData();
  }

  TaskDb taskDb = TaskDb();
  bool isLoading = false;

  String error = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController taskController = TextEditingController();

  Future<void> addData() async {
    isLoading = true;

    dynamic response = await taskDb.writeToBox(
      [
        {'title': titleController.text, 'task': taskController.text},
      ],
    );
    notifyListeners();
    if (response) {
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      error = response;
      notifyListeners();
    }
  }
}
