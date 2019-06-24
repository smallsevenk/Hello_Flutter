import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _account = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLength: 16,
                controller: _account,
                decoration: InputDecoration(
                  // icon: Icon(Icons.person),
                  contentPadding: EdgeInsets.all(10),
                  hintText: '请输入电话号码',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
              child: TextField(
                obscureText: true, //设置为密码框
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: '请输入密码',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('注册'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/regist_tel');
                  },
                ),
                SizedBox(width: 30),
                RaisedButton(
                  child: Text('登录'),
                  onPressed: () {
                    print(this._account.text);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
