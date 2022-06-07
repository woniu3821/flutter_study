import 'package:flutter/material.dart';

List list = [
  {
    'title': '三好学生',
    'time': '2020-08-11 10:00～2020-08-15 12:00',
    'count': '2',
    'apply': '不可申请'
  },
  {
    'title': '优秀志愿者',
    'time': '2020-08-11 10:00～2020-08-15 12:00',
    'count': '1',
    'apply': '可申请'
  },
];

Widget hourView() {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 16,
    ),
    child: ListView.builder(
      itemBuilder: hourItemBuilder,
      itemCount: list.length,
    ),
  );
}

Widget hourItemBuilder(context, index) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(200, 232, 232, 232),
          offset: Offset(0, 6),
          blurRadius: 5,
          spreadRadius: 5,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(children: [
        Positioned(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  list[index]['title'],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text('申请时间段：'),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 20,
                        ),
                        child: Text(
                          list[index]['time'],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('已申请人数：'),
                    Expanded(
                      child: Text(
                        list[index]['count'],
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: -90,
          top: -36,
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 75, 15, 5),
            width: 160,
            height: 100,
            color: Colors.green,
            transform: Matrix4.rotationZ(1),
            transformAlignment: Alignment.center,
            child: Text(
              list[index]['apply'],
              style: TextStyle(
                color: Colors.white,
                // overflow: Te
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    ),
  );
}
