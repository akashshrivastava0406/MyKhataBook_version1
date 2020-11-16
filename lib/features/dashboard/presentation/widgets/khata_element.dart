import 'package:flutter/material.dart';

class KhataElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text('Abhishek Kapoor', style: TextStyle(fontSize: 20),),
      subtitle: Text('You will give 500 to Abhishek Today'),

    );
  }
}
