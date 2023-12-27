import 'package:flutter/material.dart';
import 'package:todo_app/db/task_db_service.dart';

class DeleteDataProvider extends ChangeNotifier {
  TaskDb taskDb = TaskDb();

  Future<void> deleteData(int index) async {
    await taskDb.openBox();
    notifyListeners();
    await taskDb.deleteItem(index);
    notifyListeners();
  }
}
