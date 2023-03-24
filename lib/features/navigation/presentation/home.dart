import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/posting_ad_screen.dart';
import 'package:auto/features/common/bloc/internet_bloc/internet_bloc.dart';
import 'package:auto/features/common/widgets/internet_error_bottomsheet.dart';
import 'package:auto/features/navigation/domain/entities/navbar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/navigation/presentation/widgets/nav_bar_item.dart';
import 'package:auto/features/reels/presentation/pages/reels_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavItemEnum { head, search, newPost, reels, profile }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute<void>(builder: (_) => const HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _controller;

  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.head: GlobalKey<NavigatorState>(),
    NavItemEnum.search: GlobalKey<NavigatorState>(),
    NavItemEnum.newPost: GlobalKey<NavigatorState>(),
    NavItemEnum.reels: GlobalKey<NavigatorState>(),
    NavItemEnum.profile: GlobalKey<NavigatorState>(),
  };

  final List<NavBar> lables = [
    const NavBar(
      title: LocaleKeys.main,
      id: 0,
      icon: AppIcons.navBarMain,
      outlinedIcon: AppIcons.navBarMainOutline,
    ),
    const NavBar(
      title: LocaleKeys.search,
      id: 1,
      icon: AppIcons.navBarSearch,
      outlinedIcon: AppIcons.navBarSearchOutline,
    ),
    const NavBar(
      title: LocaleKeys.add,
      id: 2,
      icon: AppIcons.navBarPlus,
      outlinedIcon: AppIcons.navBarPlusOutline,
    ),
    const NavBar(
      title: LocaleKeys.band,
      id: 3,
      icon: AppIcons.navBarRoad,
      outlinedIcon: AppIcons.navBarRoadOutline,
    ),
    const NavBar(
      title: LocaleKeys.profile,
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
    if (_controller.index != 3 && _controller.index != 2) {
      setState(() {
        _currentIndex = _controller.index;
      });
      _navigatorKeys[NavItemEnum.values[_currentIndex]]?.currentState?.popUntil((route) => route.isFirst);
    }
  }

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  bool isBtmSheetOpened = false;

  @override
  Widget build(BuildContext context) => HomeTabControllerProvider(
        controller: _controller,
        child: WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab =
                !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!.currentState!.maybePop();
            if (isFirstRouteInCurrentTab) {
              if (NavItemEnum.values[_currentIndex] != NavItemEnum.head) {
                changePage(0);
                return false;
              }
            }
            return isFirstRouteInCurrentTab;
          },
          child: BlocListener<InternetBloc, InternetState>(
            listener: (context, state) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                if (!state.isConnected) {
                  isBtmSheetOpened = true;
                  showModalBottomSheet(
                    isDismissible: false,
                    constraints: const BoxConstraints(
                      maxHeight: 369,
                      minHeight: 369,
                    ),
                    enableDrag: false,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => InternetErrorBottomSheet(
                      onTap: () {
                        context.read<InternetBloc>().add(GlobalCheck(isConnected: state.isConnected));
                      },
                    ),
                  );
                } else if (isBtmSheetOpened && state.isConnected) {
                  isBtmSheetOpened = false;
                  Navigator.of(context).pop();
                }
              });
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              bottomNavigationBar: Container(
                height: 70 + MediaQuery.of(context).padding.bottom,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
                  onTap: (index) async {
                    if (index == 3) {
                      await Navigator.of(context, rootNavigator: true).push(fade(page: const ReelsScreen()));
                      changePage(_currentIndex);
                    } else if (index == 2) {
                      await Navigator.of(context, rootNavigator: true)
                          .push(fade(page: const PostingAdScreen()))
                          .then((value) {
                        if (value is bool && value) {
                          changePage(4);
                        }
                      });
                      changePage(_currentIndex);
                    }
                  },
                  indicator: const BoxDecoration(),
                  controller: _controller,
                  labelPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    GestureDetector(
                      onDoubleTap: () => _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                          .currentState!
                          .popUntil((route) => route.isFirst),
                      behavior: HitTestBehavior.opaque,
                      child: NavItemWidget(
                        navBar: lables[0],
                        currentIndex: _currentIndex,
                      ),
                    ),
                    GestureDetector(
                      onDoubleTap: () => _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                          .currentState!
                          .popUntil((route) => route.isFirst),
                      behavior: HitTestBehavior.opaque,
                      child: NavItemWidget(
                        navBar: lables[1],
                        currentIndex: _currentIndex,
                      ),
                    ),
                    GestureDetector(
                      onDoubleTap: () => _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                          .currentState!
                          .popUntil((route) => route.isFirst),
                      behavior: HitTestBehavior.opaque,
                      child: NavItemWidget(
                        navBar: lables[2],
                        currentIndex: _currentIndex,
                      ),
                    ),
                    GestureDetector(
                      onDoubleTap: () => _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                          .currentState!
                          .popUntil((route) => route.isFirst),
                      behavior: HitTestBehavior.opaque,
                      child: NavItemWidget(
                        navBar: lables[3],
                        currentIndex: _currentIndex,
                      ),
                    ),
                    GestureDetector(
                      onDoubleTap: () => _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                          .currentState!
                          .popUntil((route) => route.isFirst),
                      behavior: HitTestBehavior.opaque,
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
                  _buildPageNavigator(NavItemEnum.reels),
                  _buildPageNavigator(NavItemEnum.profile),
                ],
              ),
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
    final result = context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>();
    assert(result != null, 'No HomeTabControllerProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;
}
