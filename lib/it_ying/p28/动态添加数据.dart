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

class HomeContent extends StatefulWidget {
  final count = 0;
  HomeContent({Key key}) : super(key: key);

  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List list = List();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: this.list.map((v) {
            return Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).dividerColor))),
              child: Center(
                child: Text(v),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
          child: Text('点我加一行'),
          onPressed: () {
            setState(() {
              this.list.add('看我看我' + this.list.length.toString());
            });
          },
        ),
      ],
    );
  }
}
