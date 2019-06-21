import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AsyncTest extends StatefulWidget {
  AsyncTest({Key key}) : super(key: key);
  AsyncTestState createState() => AsyncTestState();
}

class AsyncTestState extends State<AsyncTest> {
  List widgets = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('AsyncTest'),
      ),
      body: new ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext content, int idx) {
          return getRow(idx);
        },
      ),
    );
  }

  Widget getRow(int idx) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("Row ${widgets[idx]["title"]}"),
    );
  }

  loadData() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var httpClient = new HttpClient();

    List res = [];
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        res = jsonDecode(json);
        print(res);
      } else {}
    } catch (exception) {}

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      widgets = res;
    });
  }
}
