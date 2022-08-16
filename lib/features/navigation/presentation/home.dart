import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/domain/entities/navbar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/navigation/presentation/widgets/nav_bar_item.dart';
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

  final List<NavBar> lables = const [
    NavBar(
      title: 'Главная',
      id: 0,
      icon: AppIcons.navBarMain,
      outlinedIcon: AppIcons.navBarMainOutline,
    ),
    NavBar(
      title: 'Поиск',
      id: 1,
      icon: AppIcons.navBarSearch,
      outlinedIcon: AppIcons.navBarSearchOutline,
    ),
    NavBar(
      title: 'Добавить',
      id: 2,
      icon: AppIcons.navBarPlus,
      outlinedIcon: AppIcons.navBarPlusOutline,
    ),
    NavBar(
      title: 'Полоса',
      id: 3,
      icon: AppIcons.navBarRoad,
      outlinedIcon: AppIcons.navBarRoadOutline,
    ),
    NavBar(
      title: 'Профиль',
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

  void onTabChange() => setState(() => _currentIndex = _controller.index);

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
                // border: Border(
                //
                //     top: BorderSide(
                //         color: const Color(0xFF696974).withOpacity(.2))),
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
                onTap: (index) {},
                indicator: const BoxDecoration(),
                controller: _controller,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  NavItemWidget(
                    navBar: lables[0],
                    currentIndex: _currentIndex,
                  ),
                  NavItemWidget(
                    navBar: lables[1],
                    currentIndex: _currentIndex,
                  ),
                  NavItemWidget(
                    navBar: lables[2],
                    currentIndex: _currentIndex,
                  ),
                  NavItemWidget(
                    navBar: lables[3],
                    currentIndex: _currentIndex,
                  ),
                  NavItemWidget(
                    navBar: lables[4],
                    currentIndex: _currentIndex,
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
