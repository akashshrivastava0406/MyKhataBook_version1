
import 'package:flutter/material.dart';
import 'package:mykhata/Routes/KhataRoute.dart';

class DashboardBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Wrap(
        children: [

          ListTile(title: Text('New Customer'),
            onTap: (){_addCustomer(context);},
          ),
          ListTile(title: Text('Collect Money'),
          ),
          ListTile(title: Text('Sell'),
          ),
          ListTile(title: Text('Purchase'),
          ),
        ],
      ),
    );
  }
  void _addCustomer(context)
  {
    Navigator.pushNamed(context, KhataRoute.home);
  }
}
