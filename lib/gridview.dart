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
      body: BuildGridView(),
    );
  }
}

class BuildGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        padding: EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: bulidList(30),
      ),
    );
  }

  buildGridViewByExtend() {
    return new GridView.extent(
      maxCrossAxisExtent: 30.0,
      padding: EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: bulidList(30),
    );
  }

  List<Container> bulidList(int count) {
    return new List<Container>.generate(
      count,
      (int index) => new Container(
            decoration: new BoxDecoration(
                border: Border.all(color: Colors.red, width: 2)),
            child: Image.asset(
              'images/img$index.jpg',
              fit: BoxFit.cover,
            ),
          ),
    );
  }
}
