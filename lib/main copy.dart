import 'package:flutter/material.dart';
import './res/listData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // List<Widget> _getData() {
  //   List<Widget> list = [];
  //   for (var i = 0; i < 20; i++) {
  //     list.add(ListTile(
  //       title: Text('我是一个list$i'),
  //     ));
  //   }
  //   return list;
  // }

  List<Widget> _getData() {
    return ListData.map((e) {
      return ListTile(
        title: Text(e['title']),
        subtitle: Text(e["author"]),
        leading: Image.network(e['imageUrl']),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      child: ListView(
        children: _getData(),
      ),
    );
  }
}
