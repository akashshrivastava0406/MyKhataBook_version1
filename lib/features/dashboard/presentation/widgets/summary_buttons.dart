import 'package:flutter/material.dart';
import 'summary_button.dart';

class SummaryButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Expanded(
          child:  SummaryButton('You will get', '500')
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child:  SummaryButton('You will give', '5000')
        ),
      ],
    );
  }
}
