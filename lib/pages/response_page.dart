import 'package:flutter/material.dart';
import '../widget/layout_log_print.dart';
import '../widget/responsive_column.dart';

class ResponsePage extends StatelessWidget {
  const ResponsePage({Key? key}) : super(key: key);

  static String routeName = '/response';

  @override
  Widget build(BuildContext context) {
    var _children = List.filled(
        6,
        Text(
          'A',
          textScaleFactor: 2,
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: NewWidget(children: _children),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required children,
  })  : _children = children,
        super(key: key);

  final List<Text> _children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 190,
          child: ResponsiveColumn(children: _children),
        ),
        ResponsiveColumn(children: _children),
        LayoutLogPrint<String>(
          child: Text("xx"),
          tag: '666',
        ) // 下面介绍
      ],
    );
  }
}
