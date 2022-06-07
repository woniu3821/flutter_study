import 'package:flutter/material.dart';

import './pages/PersonalPage.dart';
import './pages/Congratulate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            '荣誉称号',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final num count = 3;

  List itemList = [
    {'title': '个人荣誉称号', 'index': 0},
    {'title': '集体荣誉称号', 'index': 1}
  ];

  List<Widget> pageList = [PersonalPage(), Congratulate()];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
            children: itemList.map((val) {
          return Container(
              margin: EdgeInsets.only(bottom: 15),
              child: BarItem(
                title: val['title'],
                index: val['index'],
                onItemTap: (val) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return pageList[val];
                  }));
                },
              ));
        }).toList()));
  }
}

class BarItem extends StatelessWidget {
  final String title;
  final int index;
  final Function onItemTap;

  const BarItem({
    Key? key,
    required this.index,
    required this.title,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemTap(index);
      },
      child: Ink(
        height: 45,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.arrow_right_outlined),
          ],
        ),
      ),
    );
  }
}
