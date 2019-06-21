import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Card'),
          ),
          body: HomeContent()),
    );
  }
}

class HomeContent extends StatelessWidget {
  List<Widget> _getWraps() {
    List<Widget> temp = new List<Widget>();
    for (var i = 0; i < 10; i++) {
      String title = '第$i集';
      if (i % 4 == 0) {
        title += '哈哈哈哈1';
      }
      temp.add(MyButton(title));
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        textDirection: TextDirection.ltr,
        children: _getWraps(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  const MyButton(this.title, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1),
      ),
      child: RaisedButton(
        child: Text(this.title),
        textColor: Colors.blue,
        color: Colors.white,
        onPressed: () {},
      ),
    );
  }
}
