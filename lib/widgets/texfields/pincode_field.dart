import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PincodeField extends StatelessWidget {
  const PincodeField({
    super.key,
    required this.controller,
    required this.errorController,
    required this.onCompleted,
  });

  final TextEditingController controller;
  final StreamController<ErrorAnimationType> errorController;
  final void Function(String) onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      errorAnimationController: errorController,
      appContext: context,
      length: 4,
      animationType: AnimationType.fade,
      autoDisposeControllers: false,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontWeight: FontWeight.w500,
        fontFamily: 'MM',
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldHeight: 80,
        fieldWidth: 74,
        borderRadius: BorderRadius.circular(12),
        errorBorderColor: Colors.redAccent,
        activeFillColor: Colors.greenAccent,
        inactiveFillColor: Colors.greenAccent,
        selectedFillColor: Colors.greenAccent,
        activeColor: Colors.greenAccent,
        disabledColor: Colors.greenAccent,
        inactiveColor: Colors.greenAccent,
        selectedColor: Colors.greenAccent,
      ),
      onCompleted: onCompleted,
    );
  }
}
