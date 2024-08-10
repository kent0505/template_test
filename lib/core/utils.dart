import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/my_model.dart';

bool onboard = true;

// SHARED PREFS
Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  onboard = prefs.getBool('onboard') ?? true;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

// HIVE
List<MyModel> mymodels = [];

Future<List<MyModel>> getModels() async {
  final box = await Hive.openBox('mymodelbox');
  List data = box.get('mymodels') ?? [];
  mymodels = data.cast<MyModel>();
  log(mymodels.length.toString());
  return mymodels;
}

Future<List<MyModel>> updateModels() async {
  final box = await Hive.openBox('mymodelbox');
  box.put('mymodels', mymodels);
  mymodels = await box.get('mymodels');
  return mymodels;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}
