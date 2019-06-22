import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tabs/home.dart';
import 'tabs/category.dart';
import 'tabs/person.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  List<Widget> _widgets = [HomePage(), CategoryPage(), PersonPage()];

  AppBar _getAppBar(int idx) {
    switch (idx) {
      case 1:
        {
          return null;
        }
        break;
      default:
        {
          return AppBar(title: Text(_bottomItems[idx]['title']));
        }
        break;
    }
  }

  //配置底部导航
  List<Map> _bottomItems = [
    {'title': '首页', 'icon': Icons.home},
    {'title': '分类', 'icon': Icons.category},
    {'title': '我的', 'icon': Icons.person},
  ];

  List<BottomNavigationBarItem> _getBottomItems() {
    return this._bottomItems.map((itemInfo) {
      return BottomNavigationBarItem(
          title: Text(itemInfo['title']), icon: Icon(itemInfo['icon']));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(this._currentIndex),
      body: _widgets[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int idx) {
          setState(() {
            this._currentIndex = idx;
          });
        },
        items: _getBottomItems(),
      ),
    );
  }
}
