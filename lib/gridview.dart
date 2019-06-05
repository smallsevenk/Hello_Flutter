import 'package:flutter/material.dart';

class GridViweTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'GridView',
          style: new TextStyle(color: Colors.orange),
        ),
      ),
      body: buildGridView(),
    );
  }
}

class buildGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        padding: EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
