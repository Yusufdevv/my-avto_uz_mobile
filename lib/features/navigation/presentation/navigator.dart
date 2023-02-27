import 'package:auto/features/main/presentation/main_screen.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/profile/presentation/profile_screen.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:flutter/cupertino.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final NavItemEnum tabItem;

  const TabNavigator(
      {required this.tabItem, required this.navigatorKey, Key? key})
      : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  Map<String, WidgetBuilder> _routeBuilders(
      {required BuildContext context, required RouteSettings routeSettings}) {
    switch (widget.tabItem) {
      case NavItemEnum.head:
        return {
          TabNavigatorRoutes.root: (context) =>
              MainScreen(parentContext: context),
        };
      case NavItemEnum.search:
        return {
          TabNavigatorRoutes.root: (context) => const SearchScreen(),
        };
      case NavItemEnum.newPost:
        return {
          TabNavigatorRoutes.root: (context) => Container(),
        };
      case NavItemEnum.reels:
        return {
          TabNavigatorRoutes.root: (context) => Container(),
        };
      case NavItemEnum.profile:
        return {
          TabNavigatorRoutes.root: (context) => const ProfileScreen(),
        };
      default:
        return {
          TabNavigatorRoutes.root: (context) => Container(),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: widget.navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      requestFocus: false,
      onGenerateRoute: (routeSettings) {
        final routeBuilders =
            _routeBuilders(context: context, routeSettings: routeSettings);
        return CupertinoPageRoute(
          builder: (context) => routeBuilders.containsKey(routeSettings.name)
              ? routeBuilders[routeSettings.name]!(context)
              : Container(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

PageRouteBuilder fade({required Widget page, RouteSettings? settings}) =>
    PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
              opacity: CurvedAnimation(
                curve: const Interval(0, 1, curve: Curves.linear),
                parent: animation,
              ),
              child: child,
            ),
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => page);
