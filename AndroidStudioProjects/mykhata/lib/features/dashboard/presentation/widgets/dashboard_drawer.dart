import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykhata/features/dashboard/presentation/bloc/khata_bloc.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            child: Text('Retail Store',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),),
          ),
          ListTile(
            leading: Icon(Icons.home_rounded),
            title: Text('Home'),
            onTap: ()=>_changeToDashboardState(context),
          ),
          ListTile(
            leading: Icon(Icons.menu_book_rounded),
            title: Text('Khata'),
            onTap: ()=>_changeToKhataState(context),
          ),
          ListTile(
            leading: Icon(Icons.article_outlined),
            title: Text('Transactions'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Helpers'),
          ),
        ],
      ),
    );
  }

  void _changeToKhataState(BuildContext context)
  {
    Navigator.pop(context);
    BlocProvider.of<KhataBloc>(context).add(ShowKhataPage());

  }

  void _changeToDashboardState(BuildContext context)
  {
    Navigator.pop(context);
    BlocProvider.of<KhataBloc>(context).add(ShowDashboardPage());

  }
}
