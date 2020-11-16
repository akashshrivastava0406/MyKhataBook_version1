import 'package:flutter/material.dart';
import 'package:mykhata/features/addcustomer/presentation/widgets/actions.dart';
import 'package:mykhata/features/addcustomer/presentation/widgets/customer_loading.dart';
import 'package:mykhata/features/addcustomer/presentation/widgets/customer_widget.dart';
import 'package:mykhata/injection_container.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerAddWidget extends StatelessWidget {
  static const String routeName = '/CustomerAddWidget';
  final _nameController = new TextEditingController();
  final _contactController = new TextEditingController();
  final _addressController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
/*    return BlocProvider<CustomerBloc>(
        create: (context) => sl<CustomerBloc>(),
        child: createPage(context));*/
  }

  Widget createPage(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add New Customer'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              _goback(context);
            },
          ),
          actions: [
            ActionsWidget(_nameController),
          ],
        ),
        body: buildBody(context));
  }

  BlocConsumer<CustomerBloc, CustomerState> buildBody(
      BuildContext context) {
    return BlocConsumer<CustomerBloc, CustomerState>(
      listener: (context, state) {
        if (state is CustomerCreated) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        print("current state is {}" + state.toString());
        if (state is AddNewCustomerLoading) {
          return CustomerLoadingWidget();
        } else {
          return CustomerInputWidget(
              _nameController, _contactController, _addressController);
        }
      },
    );
  }

  void _goback(context) {
    Navigator.pop(context);
  }
}
