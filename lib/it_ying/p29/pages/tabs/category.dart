import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

final List<Tab> tabs = [
  Tab(text: '热门'),
  Tab(text: '推荐'),
  Tab(text: '热门'),
  Tab(text: '推荐'),
  Tab(text: '热门'),
  Tab(text: '推荐'),
  Tab(text: '热门'),
  Tab(text: '推荐'),
];

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  List tabBarViews = tabs.map((v) {
    return Text(v.text);
  }).toList();

  TabController _tabController;
  @override
  void dispose() {
    super.dispose();
    this._tabController.dispose();
  }

  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: tabs.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: PreferredSize(
            //设置APPBar高度
            child: AppBar(
              // backgroundColor: Colors.white,
              titleSpacing: 0,
              title: Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: TabBar(
                  // labelPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  isScrollable: true, //溢出父视图会滑动
                  // labelColor: Colors.orange, //设置tab文字颜色
                  // labelStyle: TextStyle(
                  // fontSize: 16,
                  //设置tab文字样式
                  // fontWeight: FontWeight.w100),
                  // indicatorColor: Colors.orange, //设置底线颜色
                  // indicatorSize: TabBarIndicatorSize.label, //设置底线宽度
                  // indicatorWeight: 1, //设置底线厚度
                  tabs: tabs,
                  controller: this._tabController,
                ),
              ),
            ),
            preferredSize: Size.fromHeight(40)),
        body: TabBarView(
          children: tabBarViews,
          controller: this._tabController,
        ),
      ),
      length: tabs.length,
    );
  }
}
