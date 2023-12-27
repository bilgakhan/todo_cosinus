import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/delete_data_provider.dart';
import 'package:todo_app/provider/get_data_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    GetTaskProvider provider = Provider.of<GetTaskProvider>(context);
    DeleteDataProvider delete = Provider.of<DeleteDataProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => GetTaskProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color(0xffd6d7ef),
          appBar: AppBar(
            title: const Text(
              'TODO APP',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: false,
            backgroundColor: const Color(0xff9395D3),
          ),
          body: Builder(
            builder: (context) {
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Card(
                        child: ListTile(
                          title: Text(provider.success[index]['title']),
                          subtitle: Text(provider.success[index]['task']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.edit),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () async {
                                  await delete.deleteData(index);
                                  await provider.getDataDb();
                                },
                                child: const Icon(Icons.delete),
                              ),
                              const SizedBox(width: 10),
                              Icon(Icons.check)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: provider.success.length,
                );
              }
            },
          ),
        );
      },
    );
  }
}
