import 'package:flutter/material.dart';
import 'package:my_place/models/place.dart';

class MyPlace with ChangeNotifier {
  List<Place> _item = [];

  List<Place> get items {
    return [..._item];
  }
}
