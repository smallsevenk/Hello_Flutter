import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final arguments;
  SearchPage({this.arguments});
  _SearchPageState createState() => _SearchPageState(arguments);
}

class _SearchPageState extends State<SearchPage> {
  var arguments;
  _SearchPageState(this.arguments);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text(arguments['key'] ?? '嘿嘿'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
