import 'package:flutter/material.dart';

class NewPageRoute extends StatelessWidget {
  const NewPageRoute({
    Key? key,
    this.text = '',
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: ElevatedButton(
        child: Text('返回'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
