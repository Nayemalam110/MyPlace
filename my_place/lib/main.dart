import 'package:flutter/material.dart';
import 'package:my_place/pages/add_place.dart';
import 'package:my_place/pages/place_list.dart';
import 'package:my_place/provider/my_place.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyPlaceApp());
}

class MyPlaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyPlace(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlaceList(),
        routes: {
          AddPlace.routeName: (context) => AddPlace(),
        },
      ),
    );
  }
}
