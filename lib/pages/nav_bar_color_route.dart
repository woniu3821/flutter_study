import 'package:flutter/material.dart';

class AutoNavBarColor extends StatelessWidget {
  const AutoNavBarColor({Key? key}) : super(key: key);

  static String routeName = '/auto_nav_bar';

  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const int _bluePrimaryValue = 0xFF2196F3;

  @override
  Widget build(BuildContext context) {
    var c = "dc380d";

    Color(int.parse(c, radix: 16) | 0xFF000000); //通过位运算符将Alpha设置为FF
    Color(int.parse(c, radix: 16)).withAlpha(255); //通过方法将Alpha设置为FF

    return Scaffold(
      appBar: AppBar(
        title: Text('可根据背景色改变字体颜色'),
      ),
      body: Column(children: <Widget>[
        //背景为蓝色，则title自动为白色
        NavBar(color: Colors.blue, title: "标题"),
        //背景为白色，则title自动为黑色
        NavBar(color: Colors.white, title: "标题"),
        NavBar(
            color: Color(int.parse(c, radix: 16)).withAlpha(255),
            title: "字符串转Color"),
        NavBar(color: blue.shade700, title: "MaterialColor的定义"),
      ]),
    );
  }
}

class NavBar extends StatelessWidget {
  final String title;
  final Color color;

  const NavBar({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          )
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
