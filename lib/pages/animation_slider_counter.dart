import 'package:flutter/material.dart';

import '../widget/slider_transition_x.dart';

class AnimatedSliderCounterRoute extends StatefulWidget {
  AnimatedSliderCounterRoute({Key? key}) : super(key: key);

  static const String routeName = '/slider_counter_screen';

  @override
  State<AnimatedSliderCounterRoute> createState() => _AnimatedSliderCounterRouteState();
}

class _AnimatedSliderCounterRouteState extends State<AnimatedSliderCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('计数器'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 500,
              ),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行缩放动画
                return SlideTransitionX(
                  position: animation,
                  direction: AxisDirection.down,
                  child: child,
                );
              },
              child: Text(
                '$_count',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: const Text('+1'),
            )
          ],
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  const MySlideTransition({
    Key? key,
    required Animation<Offset> position,
    this.transformHitTests = true,
    required this.child,
  }) : super(key: key, listenable: position);

  final bool transformHitTests;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }

    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
