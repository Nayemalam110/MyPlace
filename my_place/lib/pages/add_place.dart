import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_place/provider/my_place.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
  File? _pikedImage;
  void _setImage(File pikedImage01) {
    _pikedImage = pikedImage01;
  }

  void savePlace() {
    if (_titleController.text.isEmpty || _pikedImage == null) {
      return;
    }
    Provider.of<MyPlace>(context, listen: false)
        .addPlace(_titleController.text, _pikedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
              ),
              ImageInput(_setImage),
            ],
          )),
          ElevatedButton.icon(
            onPressed: savePlace,
            icon: Icon(Icons.add),
            label: Text('Add Place'),
          )
        ],
      ),
    );
  }
}
