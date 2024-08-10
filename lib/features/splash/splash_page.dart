import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void load() async {
    // context.read<TransactionBloc>().add(GetTransactionsEvent());
    await getData().then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        if (onboard) {
          // context.go('/onboard');
          context.go('/home');
        } else {
          context.go('/home');
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          color: AppColors.main,
        ),
      ),
    );
  }
}
