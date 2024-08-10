import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    this.hintText = '...',
    this.limit = 20,
    this.borderRadius = 8,
    this.number = false,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final int limit;
  final double borderRadius;
  final bool number;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9).withOpacity(0.24),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: number ? TextInputType.number : null,
        inputFormatters: [
          if (number) ...[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ] else
            LengthLimitingTextInputFormatter(limit),
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
          // fontSize: 16,
          // fontWeight: FontWeight.w500,
          // fontFamily: 'SF',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0xffFFFFFF).withOpacity(0.5),
            // fontSize: 16,
            // fontWeight: FontWeight.w500,
            // fontFamily: 'SF',
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
        onChanged: (value) {
          controller.text = value;
          onChanged();
        },
      ),
    );
  }
}
