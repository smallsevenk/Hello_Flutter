import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DatePicker extends StatefulWidget {
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _dt = DateTime.now();

  _showDatePicker() async {
    var result = await showDatePicker(
      context: context,
      initialDate: _dt,
      firstDate: DateTime(1990),
      lastDate: DateTime(3000),
      locale: Locale('zh'),
    );

    print('async:' + result.toString());
  }

  // _showDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: dt,
  //     firstDate: DateTime(1990),
  //     lastDate: DateTime(3000),
  //   ).then((result) {
  //     print('then:' + result.toString());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期控件'),
      ),
      body: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 200),
            Text('${formatDate(_dt, [yyyy, '年', mm, '月', dd])}'),
            Icon(Icons.arrow_drop_down)
          ],
        ),
        onTap: () {
          _showDatePicker();
        },
      ),
    );
  }
}
