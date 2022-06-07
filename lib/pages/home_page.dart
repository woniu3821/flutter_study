import 'package:flutter/material.dart';

import 'animate_list_route.dart';
import 'animation_builder_screen.dart';
import 'animation_hero.dart';
import 'animation_route_button.dart';
import 'animation_stagger.dart';
import 'container_page.dart';
import 'custom_scroll_view.dart';
import 'dialog_route.dart';
import 'drag_route.dart';
import 'fixed_scroll_bar.dart';
import 'future_builder_route.dart';
import 'gesture_recognizer.dart';
import 'image_scale_route.dart';
import 'infinite_grid_view.dart';
import 'infinite_list_view.dart';
import 'nav_bar_color_route.dart';
import 'response_page.dart';
import 'animation_scale_screen.dart';
import 'scroll_controller_view.dart';
import 'scroll_notification_view.dart';
import 'tab_bar_view.dart';
import 'tab_page_view.dart';
import 'theme_test_route.dart';
import 'value_listenable_route.dart';
import 'will_pop_scope_route.dart';

class RouteConfig {
  String title;
  String route;
  RouteConfig({required this.title, required this.route});
}

class GroupConfig {
  String title;
  GroupConfig(this.title);
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _list = [
    RouteConfig(route: ResponsePage.routeName, title: '响应页面'),
    RouteConfig(route: ContainerPage.routeName, title: '容器类组件'),
    GroupConfig('可滚动组件'),
    RouteConfig(route: InfiniteListView.routeName, title: '无限加载列表'),
    RouteConfig(route: ScrollControllerTestRoute.routeName, title: '测试返回顶部滚动条'),
    RouteConfig(route: ScrollNotificationTestRoute.routeName, title: '滚动监听'),
    RouteConfig(route: AnimatedListRoute.routeName, title: '列表加载动画'),
    RouteConfig(route: InfiniteGridView.routeName, title: '异步加载网格数据'),
    RouteConfig(
        route: TabPageView.routeName, title: 'pageView页面切换(支持keepAlive)'),
    RouteConfig(route: TabViewRoute.routeName, title: 'tabBar导航切换'),
    RouteConfig(
        route: CustomScrollViewRoute.routeName,
        title: '两个列表合并成一个滚动列表（CustomScrollView）'),
    RouteConfig(route: FixedScrollBarRoute.routeName, title: '滚动到顶部头部伸缩'),
    GroupConfig('功能型Widget'),
    RouteConfig(route: WillPopScopeTestRoute.routeName, title: '导航返回拦截'),
    RouteConfig(route: AutoNavBarColor.routeName, title: '根据背景色自动改变字体颜色'),
    RouteConfig(route: ThemeTestRoute.routeName, title: '测试改变主题色'),
    RouteConfig(
        route: ValueListenableRoute.routeName, title: '按需监听数据变化rebuild'),
    RouteConfig(
        route: FutureBuilderRoute.routeName,
        title: '异步UI更新（FutureBuilder、StreamBuilder）'),
    RouteConfig(route: DialogTestRoute.routeName, title: 'Dialog 对话框'),
    GroupConfig('事件处理与通知'),
    RouteConfig(route: DragRoute.routeName, title: '手势拖动、滑动'),
    RouteConfig(route: ImageScale.routeName, title: '手势图像缩放'),
    RouteConfig(route: GestureRecognizerRoute.routeName, title: '手势识别文字变色'),
    GroupConfig('动画'),
    RouteConfig(route: ScaleAnimationRoute.routeName, title: '基础缩放动画'),
    RouteConfig(
        route: ScaleAnimationByBuilder.routeName,
        title: 'AnimatedBuilder封装复用动画'),
    RouteConfig(route: AnimationRoute.routeName, title: '路由切换动画'),
    // RouteConfig(route: AnimationHero.routeName, title: '自实现hero动画'),
    RouteConfig(route: StaggerRoute.routeName, title: '交织动画（多个动画的组合）'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            if (_list[index] is RouteConfig) {
              var data = _list[index] as RouteConfig;
              return ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(data.route);
                },
                child: Text(data.title),
              );
            } else {
              var data = _list[index] as GroupConfig;
              return Center(
                child: Text(
                  data.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              );
            }
            ;
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: .0,
            );
          },
          itemCount: _list.length),
    );
  }
}
