import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/get_data_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetTaskProvider provider = Provider.of<GetTaskProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => GetTaskProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('tasks'),
            leading: IconButton(
                onPressed: () async {
                  await Hive.box('todo').clear();
                },
                icon: Icon(Icons.delete)),
          ),
          body: Builder(builder: (context) {
            if (provider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.error.isNotEmpty) {
              return Center(
                child: Text(provider.error),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(provider.success[index]['title']),
                    subtitle: Text(provider.success[index]['task']),
                  );
                },
                itemCount: provider.success.length,
              );
            }
          }),
          floatingActionButton: FloatingActionButton(onPressed: () async {
            Navigator.pushNamed(context, 'add');
          }),
        );
      },
    );
  }
}
