import 'package:flutter/material.dart';
import '../home/search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List titles = [
    '跳转到搜索页-MaterialPageRoute',
    '带值跳转到搜索页-pushNamed',
    'form',
    '用户登录',
    '商品列表',
    'datepicker',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
              context: context,
              tiles: this.titles.map((v) {
                return ListTile(
                  title: Text(v),
                  onTap: () {
                    switch (titles.indexOf(v)) {
                      case 0:
                        {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchPage(
                                  arguments: {'key': 'MaterialPageRoute'})));
                        }
                        break;
                      case 1:
                        {
                          Navigator.pushNamed(context, '/search-pushNamed',
                              arguments: {'key': '哈哈哈，终于成功了'});
                        }
                        break;
                      case 2:
                        {
                          Navigator.pushNamed(context, '/form');
                        }
                        break;
                      case 3:
                        {
                          Navigator.pushNamed(context, '/login');
                        }
                        break;
                      case 4:
                        {
                          Navigator.pushNamed(context, '/products');
                        }
                        break;
                      case 5:
                        {
                          Navigator.pushNamed(context, '/datepicker');
                        }
                        break;
                      default:
                    }
                  },
                );
              }).toList())
          .toList(),
    );
  }
}
