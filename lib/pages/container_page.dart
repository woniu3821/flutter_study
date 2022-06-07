import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widget/single_line_fitted_box.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  static String routeName = '/container';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('容器🥱组件'),
      ),
      body: Column(
        children: const [
          DecoratedWidget(),
          Divider(),
          TransformSkew(),
          Divider(),
          TransformScale(),
          Divider(),
          TransformTranslate(),
          Divider(),
          TransformRotate(),
          Divider(),
          RotateBox(),
          Divider(),
          FittedBoxWidget(),
          SingleLineFittedBox(
            child: Text(
                ' 90000000000000000  90000000000000000 90000000000000000 '),
          ),
          Divider(),
          SingleLineFittedBox(
            child: Text(' 90000000000000000 '),
          )
        ],
      ),
    );
  }
}

class DecoratedWidget extends StatelessWidget {
  const DecoratedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.orange.shade700],
        ),
        borderRadius: BorderRadius.circular(3.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class TransformSkew extends StatelessWidget {
  const TransformSkew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
        transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.deepOrange,
          child: const Text('Apartment for rent!'),
        ),
      ),
    );
  }
}

class TransformScale extends StatelessWidget {
  const TransformScale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(scale: 1.5, child: Text("Hello world"))),
        Text(
          "你好",
          style: TextStyle(color: Colors.green, fontSize: 18.0),
        )
      ],
    );
  }
}

class TransformTranslate extends StatelessWidget {
  const TransformTranslate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //默认原点为左上角，左移20像素，向上平移5像素
      child: Transform.translate(
        offset: Offset(-20.0, -5.0),
        child: Text("位移"),
      ),
    );
  }
}

class TransformRotate extends StatelessWidget {
  const TransformRotate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        //旋转90度
        angle: math.pi / 2,
        child: Text("Hello world"),
      ),
    );
  }
}

class RotateBox extends StatelessWidget {
  const RotateBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //将Transform.rotate换成RotatedBox
          child: RotatedBox(
            quarterTurns: 1, //旋转90度(1/4圈)
            child: Text("Hello world"),
          ),
        ),
        SizedBox(
          width: 200,
          child: Text(
            "RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小",
            style: TextStyle(color: Colors.green, fontSize: 18.0),
          ),
        )
      ],
    );
  }
}

class FittedBoxWidget extends StatelessWidget {
  const FittedBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          wContainer(BoxFit.none),
          Text('Wendux'),
          wContainer(BoxFit.contain),
          Text('Flutter中国'),
        ],
      ),
    );
  }
}

Widget wContainer(BoxFit boxFit) {
  return Container(
    width: 50,
    height: 50,
    color: Colors.red,
    child: FittedBox(
      fit: boxFit,
      // 子容器超过父容器大小
      child: Container(width: 60, height: 70, color: Colors.blue),
    ),
  );
}
