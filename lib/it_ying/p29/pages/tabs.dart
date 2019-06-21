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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航'),
      ),
      body: _widgets[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int idx) {
          setState(() {
            this._currentIndex = idx;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('分类'),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            title: Text('我的'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
