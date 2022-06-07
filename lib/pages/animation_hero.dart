import 'dart:ui';

import 'package:flutter/material.dart';

class AnimationHero extends StatefulWidget {
  AnimationHero({Key? key}) : super(key: key);

  static const routeName = '/animation_hero';

  @override
  State<AnimationHero> createState() => _AnimationHeroState();
}

class _AnimationHeroState extends State<AnimationHero>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _animating = false;
  late AnimationStatus _lastAnimationStatus;
  late Animation _animation;

  //两个组件在Stack中的rect
  Rect? child1Rect;
  Rect? child2Rect;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.addListener(() {
      if (_controller.isCompleted || _controller.isDismissed) {
        if (_animating) {
          setState(() {
            _animating = false;
          });
        }
      } else {
        _lastAnimationStatus = _controller.status;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //小头像
    final Widget child1 = AvaratarImg(
      onTap: () {
        //点击后执行正向动画
        setState(() {
          _animating = true;
          _controller.forward();
        });
      },
      child: SizedBox(
        width: 50,
        child: ClipOval(
          child: Image.asset('assets/bg.jpeg'),
        ),
      ),
    );
    //大头像
    final Widget child2 = AvaratarImg(
      onTap: () {
        //点击后执行正向动画
        setState(() {
          _animating = true;
          _controller.reverse();
        });
      },
      child: Image.asset(
        'assets/bg.jpeg',
        width: 400,
      ),
    );

    //是否展示小头像；只有在动画执行时、初始状态或者刚从大图变为小图时才应该显示小头像

    bool showChild1 =
        !_animating && _lastAnimationStatus != AnimationStatus.forward;

    // 执行动画时的目标组件；如果是从小图变为大图，则目标组件是大图；反之则是小图
    Widget targetWidget;
    if (showChild1 || _controller.status == AnimationStatus.reverse) {
      targetWidget = child1;
    } else {
      targetWidget = child2;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('自实现Hero动画'),
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // if(showChild1){

                // }
              ],
            ),
          );
        }),
      ),
    );
  }
}

class AvaratarImg extends StatelessWidget {
  AvaratarImg({this.onTap, required this.child});

  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}
