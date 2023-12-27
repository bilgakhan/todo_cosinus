// import 'dart:io';

// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';

// class TaskDb {
//   Box? box;

//   // openbox
//   Future<void> openBox() async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocDir.path);
//     box = await Hive.openBox("todo");
//   }

//   // addItem
//   Future<bool> writeToBox(List<Map<String, String>> data) async {
//     try {
//       await openBox();
//       await box!.addAll(data);
//       print(box!.length);
//       return true;
//     } on HiveError catch (e) {
//       print(e.message);
//       return false;
//     }
//   }

//   // get data
//   Future<dynamic> getData() async {
//     try {
//       await openBox();
//       print(box!.length);
//       return box!.values.toList();
//     } on HiveError catch (e) {
//       return e.message.toString();
//     }
//   }

//   // edit item

//   Future<void> editTask(
//     String? newTitle,
//     String? newTask, {
//     required int index,
//   }) async {
//     await openBox();
//     box!.putAt(index, [
//       newTitle,
//       newTask,
//     ]);
//   }

//   // delete item

//   Future<void> deleteItem(int index) async {
//     await openBox();
//     box!.deleteAt(index);
//   }
// }





import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class TaskDb {
  Box? box;

  // Open the Hive box
  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox("todo");
  }

  // Write data to the Hive box
  Future<bool> writeToBox(List<Map<String, String>> data) async {
    try {
      await openBox();
      await box!.addAll(data);
      print(box!.length);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Get data from the Hive box
  Future<dynamic> getData() async {
    try {
      await openBox();
      print(box!.length);
      return box!.values.toList();
    } catch (e) {
      return e.toString();
    }
  }

  // Edit a task in the Hive box
  Future<void> editTask({
    required int index,
    required String newTitle,
    required String newTask,
  }) async {
    await openBox();
    box!.putAt(index, [newTitle, newTask]);
  }

  // Delete an item from the Hive box
  Future<void> deleteItem(int index) async {
    await openBox();
    box!.deleteAt(index);
  }
}
