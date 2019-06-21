import 'package:flutter/material.dart';

class MapTest extends StatelessWidget {
  @override
  MapTest({Key key}) : super(key: key);

  final datas = ['Print1', 'castForm', 'Iterable', 'forEach'];

  final map1 = {"k1": 'v1', 'k2': 'v2'};

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('MapTest'),
      ),
      body: new ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(),
              ListTile(
                title: new Text(datas[i]),
                onTap: () {
                  if (i == 0) {
                    print('map1$map1');
                  } else if (i == 1) {
                    Map castFromMap = Map.castFrom(map1);
                    print('castFromMap$castFromMap');
                  } else if (i == 2) {
                    List listMap = <MapEntry<int, String>>[];
                    listMap.add(MapEntry(1, "哈哈哈"));
                    listMap.add(MapEntry(2, "嘻嘻嘻"));
                    Iterable listIterable = listMap.take(listMap.length);
                    Map iterableMap = Map.fromEntries(listIterable);
                    print('iterableMap$iterableMap');
                  } else if (i == 3) {
                    datas.forEach(print);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
