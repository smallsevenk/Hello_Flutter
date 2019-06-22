import 'package:flutter/material.dart';
import '../tabs.dart';

class RegistTelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RaisedButton(
          child: Text('完成'),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(builder: (context) => Tabs()),
                (route) => route == null);
          },
        ),
      ),
    );
  }
}
