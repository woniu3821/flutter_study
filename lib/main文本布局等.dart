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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          "我是一个文本我是",
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          // textScaleFactor: 1.8,
          maxLines: 2,
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.white,
            decorationStyle: TextDecorationStyle.dashed,
            fontWeight: FontWeight.w800,
            letterSpacing: 5.0,
            wordSpacing: 3.0,
          ),
        ),
        height: 300,
        width: 300,
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(
            // top: 100,
            ),
        // transform: Matrix4.translationValues(20, 0, 0),
        // transform: Matrix4.rotationZ(45),
        // transformAlignment: Alignment.center,
        alignment: Alignment.bottomCenter, //child的位置
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
