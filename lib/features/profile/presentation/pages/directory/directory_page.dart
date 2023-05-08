import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/domain/usecases/get_directories_map_point_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/get_map_dealers.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/map_screen.dart';
import 'package:auto/features/dealers/presentation/widgets/segmented_control.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_filter_page.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_list.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage>
    with TickerProviderStateMixin {
  late DirectoryBloc bloc;
  late TextEditingController controller;
  late TabController _tabController;
  late PageController _pageController;
  late MapOrganizationBloc mapOrganizationBloc;

  @override
  void initState() {
    controller = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();

    bloc = DirectoryBloc();
    mapOrganizationBloc = MapOrganizationBloc(
      isFromDirectoryPage: true,
      getDealers: GetMapDealersUseCase(),
      getDirectoriesMapPointUseCase: GetDirectoriesMapPointUseCase(),
    );
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        FocusScope.of(context).unfocus();
        controller.clear();
      }
      bloc.add(OnTabIndexChangedEvent(index: _tabController.index));
    });
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: bloc),
          BlocProvider.value(value: mapOrganizationBloc),
        ],
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: KeyboardDismisser(
            child: Scaffold(
              body: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToNero,
                    leadingWidth: 0,
                    title: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: SvgPicture.asset(AppIcons.chevronLeft),
                            ),
                          ),
                          const SizedBox(width: 7),
                          BlocConsumer<DirectoryBloc, DirectoryState>(
                            listener: (context, state) {},
                            builder: (context, state) => Expanded(
                              child: WTextField(
                                readOnly: state.isIndexOne,
                                contentPadding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                borderColor: purple,
                                disabledBorderColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToNero,
                                fillColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToNero,
                                hintText: LocaleKeys.autosalon_autoservice.tr(),
                                hintTextStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: LightThemeColors.displayMedium),
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .darkToWhite,
                                ),
                                enabledBorderColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToNero,
                                focusColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToNero,
                                onChanged: (value) {
                                  bloc.add(GetDirectoriesEvent(search: value));
                                },
                                controller: controller,
                                hasSearch: true,
                                borderRadius: 8,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          WButton(
                            height: 50,
                            width: 50,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              controller.clear();
                              Navigator.of(context, rootNavigator: true).push(
                                fade(
                                  page: MultiBlocProvider(
                                    providers: [
                                      BlocProvider.value(value: bloc),
                                      BlocProvider.value(
                                          value: mapOrganizationBloc),
                                    ],
                                    child: DirectoryFilterPage(
                                        bloc: bloc,
                                        mapBloc: mapOrganizationBloc),
                                  ),
                                ),
                              );
                            },
                            borderRadius: 12,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteSmokeToNero,
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              AppIcons.filter,
                              color: purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SegmentedControl(
                      maxHeight: 64,
                      minHeight: 64,
                      tabController: _tabController,
                      pageController: _pageController,
                    ),
                  ),
                  SliverFillRemaining(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const DirectoryList(),
                        MapScreen(
                          isFromDirectoryPage: true,
                          iconPathh: AppIcons.directoryPoint,
                          isNightMode: MyFunctions.isNightMode(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
