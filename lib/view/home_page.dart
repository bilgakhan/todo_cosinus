import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/get_data_provider.dart';
import 'package:todo_app/view/completed_tasks_page.dart';
import 'package:todo_app/view/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> _screens = [MainScreen(), CompleteTasksPage()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetTaskProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color(0xffd6d7ef),
          body: _screens[currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.pushNamed(context, 'add');
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'All',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  child: Icon(Icons.check),
                ),
                label: 'Completed',
              ),
            ],
            onTap: (v) {
              setState(
                () {
                  currentIndex = v;
                },
              );
            },
          ),
        );
      },
    );
  }
}
