import 'package:flutter/material.dart';
import 'package:mykhata/features/dashboard/presentation/widgets/khata_list.dart';
import 'package:mykhata/features/dashboard/presentation/widgets/summary_buttons.dart';
class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:
          Padding(padding: EdgeInsets.all(10), child: SummaryButtons()),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: KhataList(),
          ),
          flex: 4,
        ),
        Placeholder(
          fallbackHeight: 280,
        ),
      ],
    );
  }
}
