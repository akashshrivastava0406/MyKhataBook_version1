import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mykhata/features/dashboard/presentation/bloc/khata_bloc.dart';
import 'package:mykhata/features/dashboard/presentation/widgets/khata_list_builder.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Card(
          child: new ListTile(
            leading: Icon(Icons.search),
            title: TextField(
              decoration:
                  InputDecoration(hintText: 'Search', border: InputBorder.none),
            ),
          ),
        ),
      ),
    );
  }

}


