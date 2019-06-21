import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('注册'),
          onPressed: () {
            Navigator.pushNamed(context, '/regist_tel');
          },
        ),
      ),
    );
  }
}
