import 'package:flutter/material.dart';

import '../widget/grow_transition.dart';

class ScaleAnimationByBuilder extends StatefulWidget {
  ScaleAnimationByBuilder({Key? key}) : super(key: key);

  static const String routeName = '/animation_builder';

  @override
  State<ScaleAnimationByBuilder> createState() =>
      _ScaleAnimationByBuilderState();
}

class _ScaleAnimationByBuilderState extends State<ScaleAnimationByBuilder>
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
    animation = Tween(begin: 0.0, end: 300.0).animate(animation);

    //监听动画状态实现循环动画

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    //启动动画
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder封装复用动画'),
      ),
      body: Center(
        // child: Image.asset(
        //   'assets/bg.jpeg',
        //   width: animation.value,
        //   height: animation.value,
        // ),
        child: GrowTransiton(
          animation: animation,
          child: Image.asset('assets/bg.jpeg'),
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
