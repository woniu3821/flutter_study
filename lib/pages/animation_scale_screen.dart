import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  ScaleAnimationRoute({Key? key}) : super(key: key);

  static const String routeName = '/animation_scale';

  @override
  State<ScaleAnimationRoute> createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    //使用弹性曲线
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceIn,
    );

    //匀速
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });

    // 启动动画(正向执行)
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础动画实现'),
      ),
      body: Center(
        child: Image.asset(
          'assets/bg.jpeg',
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
