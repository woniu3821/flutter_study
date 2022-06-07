import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  WillPopScopeTestRoute({Key? key}) : super(key: key);

  static String routeName = '/will_pop_stop';

  @override
  State<WillPopScopeTestRoute> createState() => _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime? _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('一秒内点击两次退出页面'),
      ),
      body: WillPopScope(
          child: Container(
            alignment: Alignment.center,
            child: Text('1秒内连续按两次返回键退出'),
          ),
          onWillPop: () async {
            print('退出');
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt!) >
                    Duration(seconds: 1)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }

            return true;
          }),
    );
  }
}
