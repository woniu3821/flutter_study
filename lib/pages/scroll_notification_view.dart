import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  ScrollNotificationTestRoute({Key? key}) : super(key: key);

  static String routeName = '/scroll_notification';

  @override
  State<ScrollNotificationTestRoute> createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = '0%'; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动进度监听'),
      ),
      body: Scrollbar(
        //进度条
        // 监听滚动通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;

            setState(() {
              _progress = '${(progress * 100).toInt()}%';
            });

            print("BottomEdge: ${notification.metrics.extentAfter == 0}");

            return false;

            // return true; //放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                  );
                },
              ),
              CircleAvatar(
                child: Text(_progress),
                radius: 30.0,
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
