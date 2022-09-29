import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/search/domain/entities/search_item_entity.dart';
import 'package:auto/features/search/presentation/bloc/searched_bloc/searched_bloc.dart';
import 'package:auto/features/search/presentation/pages/filter_screen.dart';
import 'package:auto/features/search/presentation/pages/results_screen.dart';
import 'package:auto/features/search/presentation/widgets/filter_item.dart';
import 'package:auto/features/search/presentation/widgets/searched_models_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  late SearchedBloc searchedBloc;

  @override
  void initState() {
    searchController = TextEditingController();
    searchedBloc = SearchedBloc(carsList: searchedCars);
    super.initState();
  }

  @override
  void dispose() {
    searchController
      ..dispose()
      ..clear();
    super.dispose();
  }

  final List<SearchItemEntity> searchItemEntity = [
    const SearchItemEntity(title: 'BMW Xdrive', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X5 sport', icon: AppImages.bmwModel),
    const SearchItemEntity(
        title: 'BMW X6 Competition', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
    const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
  ];
  List<String> cars = [
    'Gentra 1.5',
    'Nexia 3',
    'Nexia 3',
    'Nexia 3',
  ];
  List<String> searchedCars = [
    'Mercedes',
    'Gentra 1.5',
    'Nexia 3',
    'Nexia 3',
    'Nexia 3',
  ];
  List<String> filterItems = [
    'Объявления',
    'С пробегом',
    'г. Ташкент',
    'г. Ташкент',
    'г. Ташкент',
  ];

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocProvider.value(
          value: searchedBloc,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(76),
                  child: Container(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToDark,
                    child: Row(
                      children: [
                        Expanded(
                          child: WTextField(
                            fillColor: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteSmoke2ToNightRider,
                            onChanged: (value) {
                              setState(() {});
                            },
                            borderColor: purple,
                            focusColor: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteSmoke2ToNightRider,
                            enabledBorderColor: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteSmoke2ToNightRider,
                            height: 44,
                            margin: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                            //width: 300,
                            borderRadius: 12,
                            controller: searchController,
                            hasSearch: true,
                            hintText: LocaleKeys.model_brand.tr(),
                            hasClearButton: true,
                          ),
                        ),
                        WButton(
                          onTap: () => Navigator.push(
                              context, fade(page: const FilterScreen())),
                          width: 44,
                          height: 44,
                          borderRadius: 12,
                          margin: const EdgeInsets.only(left: 10, right: 16),
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmoke2ToNightRider,
                          child: SvgPicture.asset(AppIcons.filter),
                        ),
                      ],
                    ),
                  )),
              body: BlocBuilder<SearchedBloc, SearchedState>(
                builder: (context, state) {
                  if (searchController.text.isNotEmpty) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 56,
                                child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      ...List.generate(
                                        filterItems.length,
                                        (index) => FilterItem(
                                          title: filterItems[index],
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Expanded(
                                child: ListView(
                                  children: [
                                    ...List.generate(
                                      searchItemEntity.length,
                                      (index) => SearchedModelsItem(
                                        controller: searchController,
                                        searchItemEntity:
                                            searchItemEntity[index],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 16,
                          right: 16,
                          child: WButton(
                            onTap: () => Navigator.push(
                              context,
                              fade(
                                page:
                                    ResultsScreen(controller: searchController),
                              ),
                            ),
                            text: LocaleKeys.show.tr() +
                                ' 32 ' +
                                LocaleKeys.result.tr(),
                          ),
                        )
                      ],
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 56,
                            child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ...List.generate(
                                    filterItems.length,
                                    (index) => FilterItem(
                                      title: filterItems[index],
                                    ),
                                  ),
                                ]),
                          ),
                          if (searchedBloc.state.searchedCars.isNotEmpty)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 20, bottom: 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LocaleKeys.last_requests.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                          fontSize: 13,
                                          color: Theme.of(context)
                                              .extension<ThemedColors>()!
                                              .dolphinToGreySuit,
                                        ),
                                  ),
                                  WScaleAnimation(
                                    onTap: () {
                                      searchedBloc.add(const ClearSearchItem());
                                    },
                                    child: Text(
                                      LocaleKeys.clear.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(color: blue),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            const SizedBox(),
                          ...List.generate(
                            state.searchedCars.length,
                            (index) => Container(
                              margin: const EdgeInsets.only(bottom: 1),
                              width: double.infinity,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteToDark,
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.searchedCars[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  WScaleAnimation(
                                    child: SvgPicture.asset(AppIcons.close),
                                    onTap: () {
                                      context.read<SearchedBloc>().add(
                                            RemoveSearchItem(
                                              carName:
                                                  state.searchedCars[index],
                                            ),
                                          );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 20, bottom: 1),
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeContainerToDark,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            child: Text(
                              LocaleKeys.popular_requests.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    fontSize: 13,
                                    color: Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .dolphinToGreySuit,
                                  ),
                            ),
                          ),
                          ...List.generate(
                            cars.length,
                            (index) => Container(
                              margin: const EdgeInsets.only(bottom: 1),
                              width: double.infinity,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteToDark,
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                cars[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      );
}
