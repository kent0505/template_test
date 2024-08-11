import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimeField extends StatelessWidget {
  const TimeField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(DateTime) onChanged;

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
        controller: controller,
        readOnly: true,
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
          // FilteringTextInputFormatter.allow(RegExp("[a-zA-Zа-яА-Я]")),
        ],
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
          hintText: hintText,
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
                color: Colors.grey,
                height: 300,
                child: CupertinoDatePicker(
                  onDateTimeChanged: onChanged,
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.time,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
