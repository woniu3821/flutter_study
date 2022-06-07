import 'package:flutter/material.dart';

class AnimationRoute extends StatelessWidget {
  const AnimationRoute({Key? key}) : super(key: key);

  static const String routeName = '/route_transition';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('页面跳转动画'),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: PageRouteB(),
                        );
                      },
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageRouteB extends StatelessWidget {
  const PageRouteB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('页面B'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('返回上个页面'),
          ),
        ));
  }
}
