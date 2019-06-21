import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:hello_flutter/dart/map.dart';
import 'package:hello_flutter/layout.dart';
import 'package:hello_flutter/favorite.dart';
import 'package:hello_flutter/gridview.dart';
import 'Widgets/grid_view.dart';
import 'package:hello_flutter/stack.dart';
import 'widgets/shopping/ShoppingList.dart';
import 'widgets/ChangeWidget.dart';
import 'widgets/async.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords(),
      routes: <String, WidgetBuilder>{
        'layout': (BuildContext context) => Layout(),
        'gridview': (BuildContext context) => GridViweTest(),
        'stack': (BuildContext context) => StackTest(),
        'Shopping': (BuildContext context) => ShoppingList(),
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Z6ListTest",
          style: new TextStyle(color: Colors.red),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          ),
          new PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                      child: Text('My Favorite'), value: 'favoriteWordPair'),
                  PopupMenuItem<String>(
                      child: Text('在Flutter中构建布局'), value: 'layout'),
                  PopupMenuItem<String>(
                      child: Text('GridView'), value: 'gridview'),
                  PopupMenuItem<String>(
                    child: Text('Stack'),
                    value: 'stack',
                  ),
                  PopupMenuItem<String>(
                    child: Text('Shopping'),
                    value: 'Shopping',
                  ),
                  PopupMenuItem<String>(
                      child: Text('ChangeWidget'), value: 'ChangeWidget'),
                  PopupMenuItem<String>(child: Text('Async'), value: 'Async'),
                  PopupMenuItem<String>(
                    child: Text('map'),
                    value: 'map',
                  ),
                  PopupMenuItem<String>(
                    child: Text('gdview'),
                    value: 'gdview',
                  ),
                ],
            onSelected: (String action) {
              switch (action) {
                case "favoriteWordPair":
                  _btnPress();
                  break;
                case "layout":
                  Navigator.of(context).pushNamed('layout');
                  break;
                case "gridview":
                  Navigator.of(context).pushNamed('gridview');
                  break;
                case "stack":
                  Navigator.of(context).pushNamed('stack');
                  break;
                case "Shopping":
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShoppingList()));
                  break;
                case "ChangeWidget":
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChangeWidget()));
                  break;
                case 'Async':
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AsyncTest()));
                  break;
                case 'map':
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapTest()));
                  break;
                case 'gdview':
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GridViewT()));
              }
            },
            onCanceled: () {
              print('canceled!');
            },
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Future _btnPress() {
    Future future = Navigator.push(context, PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
      return Favorite("Fav", _saved.toList());
    }));
    future.then((value) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('前面返回的数据是:$value'),
              ));
    });
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: new EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(prefix0.generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text(
                'Saved Suggestions',
              ),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}
