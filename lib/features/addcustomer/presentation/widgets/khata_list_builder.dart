import 'package:flutter/material.dart';
import 'package:mykhata/core/domain/entities/customer_info.dart';

class KhataListBuilder extends StatelessWidget {
  List<Customer> customers;
  KhataListBuilder(this.customers);
  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      ListView.separated(
          itemCount: customers.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(customers[index].firstName,style: TextStyle(fontSize: 20),),
              trailing: Text("0",style: TextStyle(fontSize: 20),),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
    },
          ),
    );

  }
}
