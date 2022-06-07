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

  Widget itemBuilder(content, index) {
    return ListTile(
      title: Text(ListData[index]['title']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      child: ListView.builder(
          itemCount: ListData.length, itemBuilder: itemBuilder),
    );
  }
}
