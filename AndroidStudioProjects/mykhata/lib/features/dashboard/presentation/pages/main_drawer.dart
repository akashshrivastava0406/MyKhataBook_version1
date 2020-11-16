import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykhata/features/dashboard/presentation/bloc/khata_bloc.dart';
import 'package:mykhata/features/dashboard/presentation/builder/page_builder.dart';
import 'package:mykhata/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mykhata/features/dashboard/presentation/pages/khata_page.dart';
import 'package:mykhata/injection_container.dart';
import '../widgets/widgets.dart';

class MainDrawer extends StatelessWidget {
  String title;

  MainDrawer(this.title);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<KhataBloc>(
        create: (context) => sl<KhataBloc>()..add(ShowDashboardPage())
        , child: createPage(context));
  }





  BlocBuilder<KhataBloc, KhataState> createPage(context) {
    return BlocBuilder<KhataBloc, KhataState>(
      builder: (context, state) {

        return PageBuilder().buildTitle(state).buildFab(context).
        buildBody(state).buildDrawer(context).buildActions(state,context).build(context);

      },
    );
  }


}
