import 'package:flutter/material.dart';

class CustomerInputWidget extends StatelessWidget {
  TextEditingController _nameController;
  TextEditingController _contactController;
  TextEditingController _addressController;

  CustomerInputWidget(
      this._nameController, this._contactController, this._addressController);

  @override
  Widget build(BuildContext context) {
    return Form(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration:
                const InputDecoration(hintText: 'Name', labelText: 'Name'),
          ),
          TextFormField(
            controller: _contactController,
            decoration: const InputDecoration(
                hintText: 'Contact Number', labelText: 'Contact Number'),
          ),
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(
                hintText: 'Address', labelText: 'Address'),
          ),
        ],
      ),
    );
  }
}
