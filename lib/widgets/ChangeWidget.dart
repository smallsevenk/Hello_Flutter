import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeWidget extends StatefulWidget {
  ChangeWidget({Key key}) : super(key: key);
  ChangeWidgetState createState() => ChangeWidgetState();
}

class ChangeWidgetState extends State<ChangeWidget> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('toggle one');
    } else {
      return CupertinoButton(
        onPressed: () {},
        child: Text('toggle two'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          'ChangeWidget',
          style: new TextStyle(color: Colors.red),
        ),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
