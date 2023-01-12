import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/data/datasource/user_search_datasource.dart';
import 'package:auto/features/dealers/data/repositories/user_search_repoimpl.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/user_search_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/user_search_bloc/user_search_dealer_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_filter.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_list.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_map.dart';
import 'package:auto/features/dealers/presentation/widgets/segmented_control.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'blocs/dealer_card_bloc/dealer_card_bloc.dart';

class DealerScreen extends StatefulWidget {
  const DealerScreen({Key? key, this.isDirectoryPage = false})
      : super(key: key);
  final bool isDirectoryPage;

  @override
  State<DealerScreen> createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
  late UserSearchDealerBloc userSearchDealerBloc;
  final TextEditingController controller = TextEditingController();
  late DealerCardBloc dealerCardBloc;

  @override
  void initState() {
    // userSearchDealerBloc = UserSearchDealerBloc(
    //   useCase: UserSearchUseCase(
    //       repo: UserSearchRepositoryImpl(
    //           dataSource: UserSearchDatasourceImpl(DioSettings().dio))),
    // )..add(UserSearchDealerEvent.getUserSearches());
    dealerCardBloc = DealerCardBloc(DealerUseCase())
      // ..add(DealerCardEvent.getResults(isRefresh: false, search: ''))
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => userSearchDealerBloc),
          BlocProvider.value(value: dealerCardBloc),
        ],
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
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset(AppIcons.chevronLeft),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: WTextField(
                                borderColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToNightRider,
                                fillColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToNightRider,
                                hintText: LocaleKeys.model_brand.tr(),
                                hintTextStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: grey),
                                focusColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToNightRider,
                                onChanged: (value) {
                                  dealerCardBloc.add(DealerCardEvent.getResults(isRefresh: false, search: value));

                                },
                                controller: controller,
                                hasSearch: true,
                                borderRadius: 8,
                              ),
                            ),
                            const SizedBox(width: 11),
                            WButton(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                controller.text='';
                                Navigator.of(context, rootNavigator: true)
                                      .push(fade(
                                          page: DealersFilter(
                                isDirectoryPage: widget.isDirectoryPage,
                              )));
                              },
                              borderRadius: 12,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteSmokeToNightRider,
                              padding: const EdgeInsets.all(12),
                              child: widget.isDirectoryPage
                                  ? SvgPicture.asset(AppIcons.filter)
                                  : SvgPicture.asset(
                                      AppIcons.rentFilter,
                                      color: purple,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SegmentedControl(maxHeight: 64, minHeight: 64),
                    ),
                    SliverFillRemaining(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          DealersList(
                            isDirectoryPage: widget.isDirectoryPage,
                            searchedText: controller.text,
                          ),
                          const MapScreen(),
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
