import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/presentation/pages/map_screen.dart';
import 'package:auto/features/dealers/presentation/widgets/segmented_control.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/usecases/directory_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_dir_categories_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_directories_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_filter_page.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_list.dart';
import 'package:auto/generated/locale_keys.g.dart';
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

class _DirectoryPageState extends State<DirectoryPage> {
  late DirectoryBloc bloc;
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    final repo = serviceLocator<GetUserListRepoImpl>();
    bloc = DirectoryBloc(
        getDirCategoriesUseCase: GetDirCategoriesUseCase(repository: repo),
        getDirectoriesUseCase: GetDirectoriesUseCase(repository: repo),
        directorySingleSingleUseCase:
            DirectorySingleSingleUseCase(repository: repo));

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: KeyboardDismisser(
            child: Scaffold(
              body: DefaultTabController(
                length: 2,
                child: CustomScrollView(
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
                        padding: const EdgeInsets.only(top: 12),
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
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: WTextField(
                                  contentPadding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 12),
                                  borderColor: purple,
                                  disabledBorderColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmokeToEclipse,
                                  fillColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmokeToEclipse,
                                  hintText: LocaleKeys.autosalon_autoservice.tr(),
                                  hintTextStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: grey),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: black,
                                  ),
                                  enabledBorderColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmokeToEclipse,
                                  focusColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmokeToEclipse,
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
                                height: 40,
                                width: 40,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  controller.text = '';
                                  Navigator.of(context, rootNavigator: true)
                                      .push(fade(
                                          page: BlocProvider.value(
                                    value: bloc,
                                    child: DirectoryFilterPage(bloc: bloc),
                                  )));
                                },
                                borderRadius: 12,
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToNightRider,
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(AppIcons.filter,
                                    color: purple))
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SegmentedControl(maxHeight: 64, minHeight: 64),
                    ),
                    const SliverFillRemaining(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          DirectoryList(),
                          MapScreen(isFromDirectoryPage: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
