import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  _ProductsPageState createState() => _ProductsPageState();
}

final List<Tab> tabs = [
  Tab(text: '热门'),
  Tab(text: '推荐'),
];

class _ProductsPageState extends State<ProductsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    List _tabBarViews = tabs.map((v) {
      return Text(v.text);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('TabbarController'),
        bottom: TabBar(
          controller: this._tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: _tabBarViews,
      ),
    );
    ;
  }
}
