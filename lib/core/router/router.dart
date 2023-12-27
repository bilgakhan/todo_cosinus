import 'package:flutter/material.dart';
import 'package:todo_app/view/add_page.dart';
import 'package:todo_app/view/completed_tasks_page.dart';
import 'package:todo_app/view/edit_page.dart';
import 'package:todo_app/view/home_page.dart';

class RouteGenerate {
  static final RouteGenerate _router = RouteGenerate._init();
  static RouteGenerate get router => _router;
  RouteGenerate._init();

  Route? onGenerate(RouteSettings s) {
    switch (s.name) {
      case "/":
        return _navigate(const HomePage());
      case "complete":
        _navigate(const CompleteTasksPage());
      case "add":
        return _navigate(const AddTaskPage());
      case "edit":
        return _navigate(const EditTaskPage());
    }
    return null;
  }

  MaterialPageRoute _navigate(Widget w) =>
      MaterialPageRoute(builder: (context) => w);
}
