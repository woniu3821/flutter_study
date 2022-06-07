import 'package:flutter/material.dart';

class CustomScrollViewRoute extends StatelessWidget {
  CustomScrollViewRoute({Key? key}) : super(key: key);

  static String routeName = '/custom_scroll_view';

  var listView = SliverFixedExtentList(
    delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('$index')),
        childCount: 10),
    itemExtent: 56,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('两个滚动合成一个可滚动的'),
      ),
      body: CustomScrollView(
        slivers: [listView, listView],
      ),
    );
  }
}
