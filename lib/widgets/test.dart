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
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.black,
                    child: Stack(
                      alignment: Alignment(-0.5, 0),
                      children: <Widget>[
                        Text(
                          'Hello,World',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 180,
                    child: Image.network(
                      'https://www.itying.com/images/flutter/2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 180,
                    child: ListView(
                      //禁用滚动
                      physics: new NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Container(
                          height: 85,
                          child: Image.network(
                            'https://www.itying.com/images/flutter/3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 85,
                          child: Image.network(
                            'https://www.itying.com/images/flutter/3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
