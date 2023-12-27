import 'package:flutter/material.dart';

class CompleteTasksPage extends StatelessWidget {
  const CompleteTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd6d7ef),
      appBar: AppBar(
        backgroundColor: const Color(0xff9395D3),
        title: const Text(
          'COMPLETED TASK',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
    );
  }
}
