import 'package:flutter/material.dart';
import 'package:mykhata/core/domain/entities/customer_info.dart';
import '../widgets/widgets.dart';

class KhataPage extends StatelessWidget {
  List<Customer> customers;
  KhataPage(this.customers);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: KhataListBuilder(customers),
            ),
          )
        ],
      ),
    );
  }
}
