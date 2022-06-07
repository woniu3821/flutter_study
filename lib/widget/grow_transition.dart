import 'package:flutter/material.dart';

class GrowTransiton extends StatelessWidget {
  const GrowTransiton({Key? key, required this.child, required this.animation})
      : super(key: key);

  final Widget child;

  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        child: child,
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
