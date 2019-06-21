import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('嘿嘿'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
