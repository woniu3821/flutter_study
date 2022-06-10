import 'package:flutter/material.dart';

import '../widget/gradient_button.dart';

class CustomWidget extends StatelessWidget {
  static const String routeName = '/custom_widget';

  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义组件'),
      ),
      body: GradientButton(
        height: 50,
        width: 100.0,
        child: const Text("Submit"),
        colors: const [Colors.orange, Colors.red],
        onPressed: null,
      ),
    );
  }
}
