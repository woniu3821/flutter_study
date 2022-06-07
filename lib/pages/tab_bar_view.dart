import 'package:flutter/material.dart';
import 'package:flutter_study/widget/keep_alive_wrapper.dart';

class TabViewRoute extends StatelessWidget {
  const TabViewRoute({Key? key}) : super(key: key);
  static String routeName = '/tab_bar_view';

  @override
  Widget build(BuildContext context) {
    List tabs = ["新闻", "历史", "图片"];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('tab 页切换页面'),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label, //指示器大小
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            tabs: tabs.map((e) {
              return Tab(
                text: e,
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs
              .map((e) => KeepAliveWrapper(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        e,
                        textScaleFactor: 3,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
