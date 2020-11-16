import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykhata/features/addcustomer/presentation/bloc/customer_bloc.dart';

class ActionsWidget extends StatelessWidget {
  final TextEditingController _nameController;

  ActionsWidget(this._nameController);


  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          _save(context);
        });

  }

  void _save(context) {
    print('name is' + _nameController.text);
    final name = _nameController.text;
    BlocProvider.of<CustomerBloc>(context).add(CreateCustomerEvent(name));

  }


}
