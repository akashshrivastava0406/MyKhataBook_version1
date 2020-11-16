import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykhata/features/addcustomer/presentation/bloc/bloc.dart';

import '../widgets/widgets.dart';

class SearchCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: () =>{Navigator.of(context).pop()},),
        title: TextField(
          style: TextStyle(color: Colors.white, fontSize: 20),
          autofocus: true,
          onChanged: (query) =>{
            searchCustomer(query, context)
          },
        ),
      ),
      body: buildBody(),
    );
  }

  BlocBuilder<CustomerBloc, CustomerState> buildBody() {
    return BlocBuilder(builder: (context, state) {
      if (state is CustomerQuery) {
        return KhataListBuilder(state.customers);
      } else {
        return Container();
      }
    });
  }

  void searchCustomer(query, context) {
    BlocProvider.of<CustomerBloc>(context).add(CustomerQueryEvent(query));
  }
}
