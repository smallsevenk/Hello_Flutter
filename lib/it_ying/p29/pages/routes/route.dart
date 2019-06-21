import 'package:flutter/material.dart';
import '../tabs.dart';
import '../home/search.dart';
import '../home/form.dart';
import '../user/login.dart';
import '../user/regist_tel.dart';

final routes = {
  '/': (context, {arguments}) => Tabs(),
  '/search-pushNamed': (context, {arguments}) =>
      SearchPage(arguments: arguments),
  '/form': (context, {arguments}) => FormPage(),
  '/login': (context) => LoginPage(),
  '/regist_tel': (context) => RegistTelPage(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};