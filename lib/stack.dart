import 'package:flutter/material.dart';

class StackTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Stack'),
      ),
      body: new Container(
        padding: const EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: new Stack(
          alignment: const Alignment(0.6, 0.6),
          children: [
            new CircleAvatar(
              backgroundImage: new AssetImage('images/lake.jpg'),
              radius: 100.0,
            ),
            new Container(
              decoration: new BoxDecoration(
                color: Colors.black45,
              ),
              child: new Text(
                'Mia B',
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
