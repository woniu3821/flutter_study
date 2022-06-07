import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('弹窗'),
        ),
        body: DialogPage(),
      ),
    );
  }
}

class DialogPage extends StatefulWidget {
  DialogPage({Key? key}) : super(key: key);

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  _alertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示信息'),
            content: Text('你确定要删除吗？'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'cancel');
                },
                child: Text('取消'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'confirm');
                },
                child: Text('确定'),
              )
            ],
          );
        });

    print(result);
  }

  _simpleDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: [
              SimpleDialogOption(
                child: Text('options a'),
                onPressed: () {
                  Navigator.pop(context, 'a');
                  print('options a');
                },
              ),
              SimpleDialogOption(
                child: Text('options b'),
                onPressed: () {
                  print('options b');
                },
              )
            ],
          );
        });

    print(result);
  }

  _modelBottomSheet(context) async {
    var timer;
    timer = Timer.periodic(Duration(milliseconds: 3000), (t) {
      Navigator.pop(context);
      t.cancel();
    });

    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            child: Column(
              children: [
                ListTile(
                  title: Text('分享a'),
                  onTap: () {
                    Navigator.pop(context, 'aa');
                  },
                ),
                ListTile(
                  title: Text('分享b'),
                ),
                ListTile(
                  title: Text('分享c'),
                ),
                ListTile(
                  title: Text('分享d'),
                ),
              ],
            ),
          );
        });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              _alertDialog();
            },
            child: Text('AlertDialog'),
          ),
          ElevatedButton(
            onPressed: () {
              _simpleDialog();
            },
            child: Text('SimpleDialog'),
          ),
          ElevatedButton(
            onPressed: () {
              _modelBottomSheet(context);
            },
            child: Text('ModelBottomSheet'),
          ),
        ],
      ),
    );
  }
}
