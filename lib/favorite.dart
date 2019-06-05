import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  final title;
  final saved;
  Favorite(
    this.title,
    this.saved,
  );

  @override
  State<StatefulWidget> createState() => FavoriteState(title, saved);
}

class FavoriteState extends State<Favorite> {
  List saved;
  final title;
  FavoriteState(this.title, this.saved);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.backup),
            onPressed: _goback,
          )
        ],
      ),
      body: new ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, int idx) {
          return new Text(
            'data',
            style: TextStyle(
              height: 2,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return new Container(height: 0.5, color: Colors.grey);
        },
        itemCount: saved.length,
      ),
    );
  }

  void _goback() {
    //返回上一页面并传递参数
    Navigator.pop(context, 'aiyo');
  }
}
