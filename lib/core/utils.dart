import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

String dateTimeToString(DateTime date) {
  DateFormat formatter = DateFormat('HH:mm');
  String formattedTime = formatter.format(date);
  return formattedTime;
}

DateTime stringToDateTime(String time) {
  if (time.isEmpty) return DateTime.now();
  try {
    List<String> parts = time.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    DateTime dateTime = DateTime(2024, 8, 21, hours, minutes);
    return dateTime;
  } catch (e) {
    log(e.toString());
    return DateTime.now();
  }
}

double statusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}
