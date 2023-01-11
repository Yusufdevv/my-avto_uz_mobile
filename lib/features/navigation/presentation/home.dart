import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/domain/entities/navbar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/navigation/presentation/widgets/nav_bar_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum NavItemEnum { head, search, newPost, categories, profile }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _controller;

  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.head: GlobalKey<NavigatorState>(),
    NavItemEnum.search: GlobalKey<NavigatorState>(),
    NavItemEnum.newPost: GlobalKey<NavigatorState>(),
    NavItemEnum.categories: GlobalKey<NavigatorState>(),
    NavItemEnum.profile: GlobalKey<NavigatorState>(),
  };

  final List<NavBar> lables = [
    NavBar(
      title: LocaleKeys.main.tr(),
      id: 0,
      icon: AppIcons.navBarMain,
      outlinedIcon: AppIcons.navBarMainOutline,
    ),
    NavBar(
      title: LocaleKeys.search.tr(),
      id: 1,
      icon: AppIcons.navBarSearch,
      outlinedIcon: AppIcons.navBarSearchOutline,
    ),
    NavBar(
      title: LocaleKeys.add.tr(),
      id: 2,
      icon: AppIcons.navBarPlus,
      outlinedIcon: AppIcons.navBarPlusOutline,
    ),
    NavBar(
      title: LocaleKeys.band.tr(),
      id: 3,
      icon: AppIcons.navBarRoad,
      outlinedIcon: AppIcons.navBarRoadOutline,
    ),
    NavBar(
      title: LocaleKeys.profile.tr(),
      id: 4,
      icon: AppIcons.navBarUser,
      outlinedIcon: AppIcons.navBarUserOutline,
    ),
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);

    _controller.addListener(onTabChange);

    super.initState();
  }

  void onTabChange() {
    setState(() {
      _currentIndex = _controller.index;
      _navigatorKeys[NavItemEnum.values[_currentIndex]]!
          .currentState!
          .popUntil((route) => route.isFirst);
    });
  }

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) => HomeTabControllerProvider(
        controller: _controller,
        child: WillPopScope(
          onWillPop: () async {
            print('calling pop');
            final isFirstRouteInCurrentTab =
                !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                    .currentState!
                    .maybePop();
            if (isFirstRouteInCurrentTab) {
              if (NavItemEnum.values[_currentIndex] != NavItemEnum.head) {
                changePage(0);
                return false;
              }
            }
            return isFirstRouteInCurrentTab;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: Container(
              height: 68 + MediaQuery.of(context).padding.bottom,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Theme.of(context).appBarTheme.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF171725).withOpacity(0.05),
                    blurRadius: 24,
                    offset: const Offset(0, -8),
                  )
                ],
              ),
              child: TabBar(
                enableFeedback: true,
                onTap: (index) {
                  // if (index == 2) {
                  //   Navigator.of(context, rootNavigator: true)
                  //       .push(fade(page: const QRScannerScreen()));
                  // }
                },
                indicator: const BoxDecoration(),
                controller: _controller,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  GestureDetector(
                    onDoubleTap: () =>
                        _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                            .currentState!
                            .popUntil((route) => route.isFirst),
                    child: NavItemWidget(
                      navBar: lables[0],
                      currentIndex: _currentIndex,
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () =>
                        _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                            .currentState!
                            .popUntil((route) => route.isFirst),
                    child: NavItemWidget(
                      navBar: lables[1],
                      currentIndex: _currentIndex,
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () =>
                        _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                            .currentState!
                            .popUntil((route) => route.isFirst),
                    child: NavItemWidget(
                      navBar: lables[2],
                      currentIndex: _currentIndex,
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () =>
                        _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                            .currentState!
                            .popUntil((route) => route.isFirst),
                    child: NavItemWidget(
                      navBar: lables[3],
                      currentIndex: _currentIndex,
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () =>
                        _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                            .currentState!
                            .popUntil((route) => route.isFirst),
                    child: NavItemWidget(
                      navBar: lables[4],
                      currentIndex: _currentIndex,
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildPageNavigator(NavItemEnum.head),
                _buildPageNavigator(NavItemEnum.search),
                _buildPageNavigator(NavItemEnum.newPost),
                _buildPageNavigator(NavItemEnum.categories),
                _buildPageNavigator(NavItemEnum.profile),
              ],
            ),
          ),
        ),
      );
}

class HomeTabControllerProvider extends InheritedWidget {
  final TabController controller;

  const HomeTabControllerProvider({
    required Widget child,
    required this.controller,
    Key? key,
  }) : super(key: key, child: child);

  static HomeTabControllerProvider of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>();
    assert(result != null, 'No HomeTabControllerProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;
}
