import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerRoute extends StatefulWidget {
  GestureRecognizerRoute({Key? key}) : super(key: key);
  static String routeName = '/gesture_recognizer_route';

  @override
  State<GestureRecognizerRoute> createState() => _GestureRecognizerRouteState();
}

class _GestureRecognizerRouteState extends State<GestureRecognizerRoute> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  bool _toggle = false; //变色开关

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通过手势事件使文本变色'),
      ),
      body: Center(
        child: Text.rich(TextSpan(
          children: [
            TextSpan(text: "你好世界"),
            TextSpan(
                text: '点击我变色',
                style: TextStyle(
                  fontSize: 30,
                  color: _toggle ? Colors.blue : Colors.red,
                ),
                recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  }),
          ],
        )),
      ),
    );
  }
}
