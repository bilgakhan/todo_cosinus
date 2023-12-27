import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/add_data_provider.dart';
import 'package:todo_app/provider/get_data_provider.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddDataProvider provider = Provider.of<AddDataProvider>(context);
    GetTaskProvider getTask = Provider.of<GetTaskProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => AddDataProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color(0xffd6d7ef),
          appBar: AppBar(
            title: const Text('tasks'),
          ),
          body: Column(
            children: [
              TextField(
                controller: provider.titleController,
                decoration: const InputDecoration(
                  hintText: 'title',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: provider.taskController,
                decoration: const InputDecoration(
                  hintText: 'task',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await provider.addData();
              await getTask.getDataDb();
              provider.taskController.clear();
              provider.titleController.clear();
              Navigator.pop(context);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
