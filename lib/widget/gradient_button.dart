import 'dart:ui';

import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton({
    Key? key,
    required this.height,
    required this.child,
    required this.onPressed,
    this.width,
    this.colors,
    this.borderRadius,
  }) : super(key: key);

  final double height;
  final Widget child;
  final double? width;
  final VoidCallback? onPressed;
  final List<Color>? colors;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    List<Color> _colors = colors ?? [theme.primaryColor, theme.primaryColorDark];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
