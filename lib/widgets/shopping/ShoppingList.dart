import 'package:flutter/material.dart';
import 'ShoppingListItem.dart';

class ShoppingList extends StatefulWidget {
  final List<Product> prds = <Product>[
    new Product(name: '番茄'),
    new Product(name: '辣椒'),
    new Product(name: '茄子'),
    new Product(name: '芥蓝'),
    new Product(name: '黄瓜'),
    new Product(name: '白菜'),
    new Product(name: '西蓝花'),
    new Product(name: '韭菜'),
    new Product(name: '莲藕'),
    new Product(name: '西芹'),
    new Product(name: '土豆'),
    new Product(name: '冬瓜'),
    new Product(name: '胡瓜'),
    new Product(name: '豇豆'),
    new Product(name: '四季豆'),
    new Product(name: '红萝卜'),
    new Product(name: '白萝卜'),
    new Product(name: '胡萝卜'),
    new Product(name: '豆腐'),
    new Product(name: '山药'),
    new Product(name: '洋葱'),
    new Product(name: '豆芽'),
    new Product(name: '金针菇'),
    new Product(name: '香菇'),
  ];

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework will re-use the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When user changes what is in the cart, we need to change _shoppingCart
      // inside a setState call to trigger a rebuild. The framework then calls
      // build, below, which updates the visual appearance of the app.

      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tiles = widget.prds.map((Product product) {
      return new ShoppingListItem(
        product: product,
        inCart: _shoppingCart.contains(product),
        onCartChanged: _handleCartChanged,
      );
    });

    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        // ListView距离两侧的距离
        padding: new EdgeInsets.symmetric(vertical: 18.0),
        children: divided,
      ),
    );
  }
}
