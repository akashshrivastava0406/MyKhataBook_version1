import 'package:flutter/material.dart';
class SummaryButton extends StatelessWidget {
  String textMessage;
  String Amount;
  SummaryButton(this.textMessage,this.Amount);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Amount),
          Text(textMessage)],
      ),
      color: Colors.white,
    );
  }
}
