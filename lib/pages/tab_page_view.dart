import 'package:flutter/material.dart';

import '../widget/keep_alive_wrapper.dart';

class TabPageView extends StatelessWidget {
  const TabPageView({Key? key}) : super(key: key);
  static String routeName = '/tab_page_view';

  @override
  Widget build(BuildContext context) {
    var _children = <Widget>[];

    for (var i = 0; i < 6; i++) {
      _children.add(KeepAliveWrapper(
        child: Page(text: '$i'),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('滑动切换页面'),
      ),
      body: PageView(
        allowImplicitScrolling: true, //缓存前后各一页
        children: _children,
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");

    return Center(
      child: Text(
        widget.text,
        textScaleFactor: 5,
      ),
    );
  }
}
