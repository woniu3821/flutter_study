import 'package:flutter/material.dart';

import '../../pages/animation_builder_screen.dart';
import '../../pages/animation_counter_screen.dart';
import '../../pages/animation_default.dart';
import '../../pages/animation_hero.dart';
import '../../pages/animation_route_button.dart';
import '../../pages/animation_slider_counter.dart';
import '../../pages/animation_stagger.dart';
import '../../pages/custom_widget.dart';
import '../../pages/home_page.dart';
import '../../pages/animate_list_route.dart';
import '../../pages/container_page.dart';
import '../../pages/custom_scroll_view.dart';
import '../../pages/dialog_route.dart';
import '../../pages/drag_route.dart';
import '../../pages/fixed_scroll_bar.dart';
import '../../pages/future_builder_route.dart';
import '../../pages/gesture_recognizer.dart';
import '../../pages/image_scale_route.dart';
import '../../pages/infinite_grid_view.dart';
import '../../pages/infinite_list_view.dart';
import '../../pages/nav_bar_color_route.dart';
import '../../pages/response_page.dart';
import '../../pages/animation_scale_screen.dart';
import '../../pages/scroll_controller_view.dart';
import '../../pages/scroll_notification_view.dart';
import '../../pages/tab_bar_view.dart';
import '../../pages/tab_page_view.dart';
import '../../pages/theme_test_route.dart';
import '../../pages/value_listenable_route.dart';
import '../../pages/will_pop_scope_route.dart';

abstract class Routes {
  static String initialRoute = '/';

  static Map<String, WidgetBuilder> routes = {
    '/': (context) => HomePage(),
    ResponsePage.routeName: (context) => ResponsePage(),
    ContainerPage.routeName: (context) => ContainerPage(),
    InfiniteListView.routeName: (context) => InfiniteListView(),
    ScrollControllerTestRoute.routeName: (context) => ScrollControllerTestRoute(),
    ScrollNotificationTestRoute.routeName: (context) => ScrollNotificationTestRoute(),
    AnimatedListRoute.routeName: (context) => AnimatedListRoute(),
    InfiniteGridView.routeName: (context) => InfiniteGridView(),
    TabPageView.routeName: (context) => TabPageView(),
    TabViewRoute.routeName: (context) => TabViewRoute(),
    CustomScrollViewRoute.routeName: (context) => CustomScrollViewRoute(),
    FixedScrollBarRoute.routeName: (context) => FixedScrollBarRoute(),
    WillPopScopeTestRoute.routeName: (context) => WillPopScopeTestRoute(),
    AutoNavBarColor.routeName: (context) => AutoNavBarColor(),
    ThemeTestRoute.routeName: (context) => ThemeTestRoute(),
    ValueListenableRoute.routeName: (context) => ValueListenableRoute(),
    FutureBuilderRoute.routeName: (context) => FutureBuilderRoute(),
    DialogTestRoute.routeName: (context) => DialogTestRoute(),
    DragRoute.routeName: (context) => DragRoute(),
    ImageScale.routeName: (context) => ImageScale(),
    GestureRecognizerRoute.routeName: (context) => GestureRecognizerRoute(),
    ScaleAnimationRoute.routeName: (context) => ScaleAnimationRoute(),
    ScaleAnimationByBuilder.routeName: (context) => ScaleAnimationByBuilder(),
    AnimationRoute.routeName: (context) => const AnimationRoute(),
    AnimationHero.routeName: (context) => AnimationHero(),
    StaggerRoute.routeName: (context) => StaggerRoute(),
    AnimatedSwitcherCounterRoute.routeName: (context) => AnimatedSwitcherCounterRoute(),
    AnimatedSliderCounterRoute.routeName: (context) => AnimatedSliderCounterRoute(),
    AnimatedWidgetsTest.routeName: (context) => AnimatedWidgetsTest(),
    CustomWidget.routeName: (context) => CustomWidget(),
  };
}
