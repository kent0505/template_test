import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: CupertinoButton(
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.zero,
        child: const Row(
          children: [
            SizedBox(width: 15),
            Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'SFProText',
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
