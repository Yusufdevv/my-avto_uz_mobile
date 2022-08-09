import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/search/domain/entities/search_item_entity.dart';
import 'package:auto/features/search/presentation/bloc/searched_bloc/searched_bloc.dart';
import 'package:auto/features/search/presentation/pages/filter_screen.dart';
import 'package:auto/features/search/presentation/widgets/filter_item.dart';
import 'package:auto/features/search/presentation/widgets/searched_models_item.dart';
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
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: WAppBar(
              height: 76,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                  color: dark.withOpacity(.08),
                ),
                BoxShadow(
                  offset: const Offset(0, -1),
                  color: dark.withOpacity(.08),
                ),
              ],
              hasBackButton: false,
              extraActions: [
                WTextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  height: 44,
                  margin: const EdgeInsets.only(top: 15),
                  width: 300,
                  borderRadius: 12,
                  controller: searchController,
                  hasSearch: true,
                  hintText: 'Марка, Модель',
                  hasClearButton: true,
                ),
                const Spacer(),
                WButton(
                  onTap: () =>
                      Navigator.push(context, fade(page: const FilterScreen())),
                  width: 44,
                  height: 44,
                  borderRadius: 12,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .whiteSmoke2ToNightRider,
                  child: SvgPicture.asset(AppIcons.filter),
                ),
                const SizedBox(
                  width: 12,
                )
              ],
            ),
            body: BlocBuilder<SearchedBloc, SearchedState>(
              builder: (context, state) {
                if (searchController.text.isNotEmpty) {
                  return SizedBox(
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
                                  searchItemEntity: searchItemEntity[index],
                                ),

                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child:Column(
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
                                  'Последние запросы',
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
                                    'Очистить',
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
                                          state.searchedCars[index]),
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
                            'Популярные запросы',
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
            bottomNavigationBar: searchController.text.isNotEmpty ?  WButton(
              margin: const EdgeInsets.only(bottom: 16),
              onTap: () {},
              text: 'Показать 32 результата',
            ) : const SizedBox(),
          ),
        ),
      );
}
