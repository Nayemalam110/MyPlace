import 'package:flutter/material.dart';
import 'package:my_place/pages/add_place.dart';
import 'package:my_place/provider/my_place.dart';
import 'package:provider/provider.dart';

class PlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Palace'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlace.routeName);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder(
          future:
              Provider.of<MyPlace>(context, listen: false).fetchAndSetPlaces(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<MyPlace>(
                      builder: ((context, value, child) => value.items.isEmpty
                          ? Center(
                              child: Text('No item'),
                            )
                          : ListView.builder(
                              itemBuilder: (context, i) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(value.items[i].image!),
                                  ),
                                  title: Text(value.items[i].title),
                                );
                              },
                              itemCount: value.items.length,
                            ))),
        ));
  }
}
