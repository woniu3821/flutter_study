import 'package:flutter/material.dart';

List _list = [
  {'title': '三好学生', 'time': '2020-08-12 07:00', 'pass': false},
  {'title': '三好学生1', 'time': '2020-08-12 07:00', 'pass': false},
  {'title': '三好学生2', 'time': '2020-08-12 07:00', 'pass': false},
  {'title': '三好学生3', 'time': '2020-08-12 07:00', 'pass': false},
  {'title': '三好学生4', 'time': '2020-08-12 07:00', 'pass': false},
  {'title': '三好学生5', 'time': '2020-08-12 07:00', 'pass': false},
];

Widget myApplyView() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    child: ListView.builder(
      itemBuilder: _myApplyBuilder,
      itemCount: _list.length,
    ),
  );
}

Widget _myApplyBuilder(context, index) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(200, 232, 232, 232),
            offset: Offset(0, 5),
            blurRadius: 5,
            spreadRadius: 5,
          )
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                _list[index]['title'],
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '通过',
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
        Text("申请时间：${_list[index]['time']}"),
      ],
    ),
  );
}
