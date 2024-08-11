import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'widgets/core/utils.dart';
import 'widgets/texfields/number_field.dart';
import 'widgets/texfields/pincode_field.dart';
import 'widgets/texfields/time_field.dart';
import 'widgets/texfields/txt_field.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final errorController = StreamController<ErrorAnimationType>();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([controller1]);
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          const SizedBox(height: 20),
          TxtField(
            controller: controller1,
            hintText: 'Txt',
            active: active,
            onChanged: checkActive,
          ),
          const SizedBox(height: 20),
          NumberField(
            controller: controller2,
            hintText: 'Number',
            onChanged: () {},
          ),
          const SizedBox(height: 20),
          PincodeField(
            controller: controller3,
            errorController: errorController,
            onCompleted: (value) {
              errorController.add(ErrorAnimationType.shake);
              controller3.clear();
            },
          ),
          const SizedBox(height: 20),
          TimeField(
            controller: controller4,
            hintText: '00:00',
            onChanged: (date) {
              setState(() {
                controller4.text = formatDateTime(date);
              });
            },
          ),
        ],
      ),
    );
  }
}
