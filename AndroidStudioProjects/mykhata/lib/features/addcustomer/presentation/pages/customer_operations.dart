import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykhata/features/addcustomer/presentation/bloc/customer_bloc.dart';
import 'package:mykhata/features/addcustomer/presentation/pages/SearchCustomer.dart';

import '../../../../injection_container.dart';

class CustomerOperations extends StatelessWidget {
  static const String routeName = '/CustomerOperations';
  String operation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerBloc>(
        create: (context) => sl<CustomerBloc>()..add(CustomerQueryEvent('')),
        child: createPage(context)
    );
  }

  Widget createPage(context)
  {


        return SearchCustomer();
  }
}
