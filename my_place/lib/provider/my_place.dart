import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_place/models/place.dart';

class MyPlace with ChangeNotifier {
  List<Place> _item = [];

  List<Place> get items {
    return [..._item];
  }

  void addPlace(String title, File? image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        image: image);
    _item.add(newPlace);
    notifyListeners();
  }
}
