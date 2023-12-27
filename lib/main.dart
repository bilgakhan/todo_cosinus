import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/router/router.dart';
import 'package:todo_app/provider/add_data_provider.dart';
import 'package:todo_app/provider/get_data_provider.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetTaskProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddDataProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerate.router.onGenerate,
        initialRoute: "/",
      ),
    );
  }
}
