import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  PersonPage({Key key}) : super(key: key);

  _personPageState createState() => _personPageState();
}

class _personPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Person'),
    );
  }
}
