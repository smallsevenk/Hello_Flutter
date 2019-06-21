import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/list_data.dart';

class GridViewT extends StatelessWidget {
  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      print(value['imageUrl']);
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(value['imageUrl']),
            SizedBox(
              height: 10,
            ),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orange, fontSize: 14),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
        ),
      );
    });

    return tempList.toList();
  }

  Widget _getItem(BuildContext context, int idx) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(listData[idx]['imageUrl']),
          SizedBox(
            height: 10,
          ),
          Text(
            listData[idx]['title'],
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orange, fontSize: 14),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
      ),
    );
    ;
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('GirdView2'),
  //     ),
  //     body: GridView.count(
  //       crossAxisCount: 2,
  //       crossAxisSpacing: 10,
  //       mainAxisSpacing: 10,
  //       padding: EdgeInsets.all(10),
  //       children: _getListData(),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GirdView2'),
      ),
      body: GridView.builder(
        itemCount: listData.length,
        itemBuilder: _getItem,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
