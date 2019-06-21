import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 100,
                  top: 100,
                  child: Icon(
                    Icons.home,
                    size: 40,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 50,
                  child: Icon(
                    Icons.share,
                    size: 40,
                    color: Colors.yellow,
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 300,
                  child: Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
