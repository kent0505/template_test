import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils.dart';

class DateField extends StatefulWidget {
  const DateField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function() onChanged;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  void onDateTimeChanged(DateTime date) {
    setState(() {
      widget.controller.text = dateToString(date);
    });
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        readOnly: true,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: 'SFM',
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'SFM',
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () async {
          await showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.white,
                height: 300,
                child: CupertinoDatePicker(
                  onDateTimeChanged: onDateTimeChanged,
                  initialDateTime: stringToDate(widget.controller.text),
                  mode: CupertinoDatePickerMode.date,
                  minimumYear: 2000,
                  maximumYear: DateTime.now().year,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
