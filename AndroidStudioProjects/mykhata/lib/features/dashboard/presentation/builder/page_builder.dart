import 'package:flutter/material.dart';
import 'package:mykhata/Routes/KhataRoute.dart';
import 'package:mykhata/features/dashboard/presentation/bloc/khata_bloc.dart';
import 'package:mykhata/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mykhata/features/dashboard/presentation/pages/khata_page.dart';
import '../widgets/widgets.dart';

class PageBuilder
{
  String title;
  List<Widget> actions;
  Widget drawer;
  Widget body;
  FloatingActionButton fab;
  
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: this.actions,
      ),
      drawer: drawer,
      backgroundColor: Color.fromARGB(242, 242, 242, 242),
      body: body,
      
      floatingActionButton: fab,
    );

  }
  PageBuilder buildTitle(state)
  {
    if (state is LoadingState) {
      title =  'MyKhata';
    } else if (state is ShowDashboardState) {
      title = 'Home';
    } else if (state is ShowKhataState) {
      title = 'Khata';
    } else {
      title = 'MyKhata';
    };

    return this;
  }
  PageBuilder buildActions(state, context) {

    if (state is ShowKhataState) {
      this.actions= [
        IconButton(icon: Icon(Icons.search), 
            onPressed: () =>{
              Navigator.pushNamed(context, KhataRoute.customerOperations)
            }),
        IconButton(icon: Icon(Icons.filter_list), onPressed: () =>{})
      ];
    } else {
      this.actions = null;
    };
    return this;
  }
  PageBuilder buildBody(state) {

        if (state is LoadingState) {
          this.body =  KhataLoadingWidget();
        } else if (state is ShowDashboardState) {
          this.body = Dashboard();
        } else if (state is ShowKhataState) {
          this.body = KhataPage(state.customers);
        } else {
          this.body = KhataLoadingWidget();
        };
        return this;
  }
  PageBuilder buildFab(context)
  {
    this.fab= FloatingActionButton(child: Icon(Icons.add),
        onPressed: () {
      _settingBottomSHeet(context);
    });
    return this;
  }
  PageBuilder buildDrawer(context)
  {
    this.drawer = DashboardDrawer();
    return this;
  }

  void _settingBottomSHeet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return DashboardBottomSheet();
        });
  }
}