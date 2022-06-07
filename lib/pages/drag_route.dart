import 'package:flutter/material.dart';

class DragRoute extends StatefulWidget {
  DragRoute({Key? key}) : super(key: key);

  static String routeName = '/drag_route_test';

  @override
  State<DragRoute> createState() => _DragRouteState();
}

class _DragRouteState extends State<DragRoute>
    with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖动'),
      ),
      body: Stack(
        children: [
          Positioned(
              left: _left,
              top: _top,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('A'),
                ),
                onPanDown: (e) {
                  //打印手指按下的位置(相对于屏幕)
                  print("用户手指按下：${e.globalPosition}");
                },
                //任意方向
                // onPanUpdate: (detail) {
                //   setState(() {
                //     print(detail.delta);
                //     _left += detail.delta.dx;
                //     _top += detail.delta.dy;
                //   });
                // },
                //垂直方向拖动事件
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
                onPanEnd: (DragEndDetails e) {
                  //打印滑动结束时在x、y轴上的速度
                  print(e.velocity);
                },
              )),
        ],
      ),
    );
  }
}
