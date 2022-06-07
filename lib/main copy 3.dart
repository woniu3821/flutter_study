import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List list = [];

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: list.map((e) => Text(e)).toList(),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            list.add('我是listq');
          });
        },
        child: Text('button'),
      )
    ]);
  }
}
