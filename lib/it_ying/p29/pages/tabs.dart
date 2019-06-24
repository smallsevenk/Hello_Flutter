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
  List<List> drawers = [
    [
      Text(
        '激活会员',
        style: TextStyle(fontSize: 16, color: Colors.blue),
      ),
      Icons.home
    ],
    [
      Text(
        '我的相册',
        style: TextStyle(fontSize: 16, color: Colors.blue),
      ),
      Icons.photo
    ],
    [
      Text(
        '安全中心',
        style: TextStyle(fontSize: 16, color: Colors.blue),
      ),
      Icons.settings
    ],
  ];

  AppBar _getAppBar(int idx) {
    switch (idx) {
      case 0:
        {
          return AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text(_bottomItems[idx]['title']),
          );
        }
        break;
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

  Drawer _getDrawer(int idx) {
    if (idx == 0) {
      return Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/1.png'),
                    ),
                    accountName: Text('你好,Fullter'),
                    accountEmail: Text('smallsevenk@vip.qq.com'),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.itying.com/images/flutter/2.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: this.drawers.map((drawer) {
                  return ListTile(
                    title: drawer[0],
                    leading: CircleAvatar(
                      child: Icon(drawer[1]),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/products');
                    },
                  );
                }),
              ).toList(),
            )
          ],
        ),
      );
    } else {
      return null;
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
      floatingActionButton: Container(
        width: 80,
        height: 80,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              this._currentIndex = 1;
            });
          },
          backgroundColor: _currentIndex == 1 ? Colors.blue : Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 36,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: this._currentIndex,
        onTap: (int idx) {
          setState(() {
            this._currentIndex = idx;
          });
        },
        items: _getBottomItems(),
      ),
      drawer: _getDrawer(this._currentIndex),
    );
  }
}
