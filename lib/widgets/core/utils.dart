import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) {
      return false;
    }
  }
  return true;
}

String formatDateTime(DateTime date) {
  DateFormat formatter = DateFormat('HH:mm');
  String formattedTime = formatter.format(date);
  return formattedTime;
}
