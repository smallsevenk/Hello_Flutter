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

class _CategoryPageState extends State<CategoryPage> {
  List tabBarViews = tabs.map((v) {
    return Text(v.text);
  }).toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
            isScrollable: true, //溢出父视图会滑动
            labelColor: Colors.orange, //设置tab文字颜色
            labelStyle: TextStyle(
                //设置tab文字样式
                fontWeight: FontWeight.w100),
            indicatorColor: Colors.orange, //设置底线颜色
            indicatorSize: TabBarIndicatorSize.label, //设置底线宽度
            indicatorWeight: 1, //设置底线厚度
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: tabBarViews,
        ),
      ),
      length: tabs.length,
    );
  }
}
