import 'package:flutter/material.dart';

class ImageScale extends StatefulWidget {
  ImageScale({Key? key}) : super(key: key);

  static String routeName = '/image_scale';

  @override
  State<ImageScale> createState() => _ImageScaleState();
}

class _ImageScaleState extends State<ImageScale> {
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图像手势放大缩小'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          child: Image.asset(
            'assets/bg.jpeg',
            width: _width,
          ),
          onScaleUpdate: (e) {
            setState(() {
              _width = 200 * e.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}
