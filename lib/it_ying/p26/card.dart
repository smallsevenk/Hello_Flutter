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
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  List cards = [
    {
      'name': '张三',
      'zw': '高级吹逼工程师',
      'tel': '132xxxxxxxx',
      'address': '河南省长春市望城区',
      'pic': 'https://www.itying.com/images/flutter/2.png',
      'icon': 'https://www.itying.com/images/flutter/2.png'
    },
    {
      'name': '李四',
      'zw': '高级装逼工程师',
      'tel': '133xxxxxxxx',
      'address': '河南省长春市望城区',
      'pic': 'https://www.itying.com/images/flutter/2.png',
      'icon': 'https://www.itying.com/images/flutter/2.png'
    },
    {
      'name': '王麻子',
      'zw': '高级被吹工程师',
      'tel': '134xxxxxxxx',
      'address': '河南省长春市望城区',
      'pic': 'https://www.itying.com/images/flutter/2.png',
      'icon': 'https://www.itying.com/images/flutter/2.png'
    }
  ];
  //纯文本卡片列表
  Widget _getCards(BuildContext context, int idx) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(cards[idx]['name']),
            subtitle: Text(cards[idx]['zw']),
          ),
          ListTile(
            title: Text(cards[idx]['tel']),
          ),
          ListTile(
            title: Text(cards[idx]['address']),
          )
        ],
      ),
    );
  }

  //图片+文字卡片
  Widget _getPicCards(BuildContext context, int idx) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(cards[idx]['pic'], fit: BoxFit.cover)),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(cards[idx]['icon']),
            ),
            title: Text(cards[idx]['name']),
            subtitle: Text(cards[idx]['zw']),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: _getPicCards,
    );
  }
}
