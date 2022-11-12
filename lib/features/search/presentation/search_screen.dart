import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/search/domain/entities/search_item_entity.dart';
import 'package:auto/features/search/domain/usecases/get_search_result_usecase.dart';
import 'package:auto/features/search/presentation/bloc/search_results/search_result_bloc.dart';
import 'package:auto/features/search/presentation/pages/parameter_screen.dart';
import 'package:auto/features/search/presentation/pages/results_screen.dart';
import 'package:auto/features/search/presentation/part/popular_searches_field.dart';
import 'package:auto/features/search/presentation/part/sort_modal_bottom_sheet.dart';
import 'package:auto/features/search/presentation/part/suggestion_page.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:auto/features/search/presentation/widgets/searched_models_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
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
  late SearchResultBloc searchResultBloc;
  FocusNode focusNode = FocusNode();
  final List<bool> hasDiscount = [true, false];
  final List<String> owner = ['Анвар Гулямов', 'ORIENT MOTORS'];
  final List<String> ownerType = ['Частное лицо', 'Автосалон'];
  final List<String> publishTime = ['Сегодня', '27 февраля'];
  final List<String> sellType = ['Продажа Автомобиля', 'Аренда c выкупом'];

  @override
  void initState() {
    searchController = TextEditingController();
    searchResultBloc = SearchResultBloc(GetSearchResultsUseCase())
      ..add(SearchResultEvent.getResults(isRefresh: false));
    focusNode.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    searchController
      ..dispose()
      ..clear();
    super.dispose();
  }

  int summ = 0;
  int date = 1;
  final List<String> searchItemEntity = [
    'BMW Xdrive',
    'BMW X5 sport',
    'BMW X6 Competition',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7',
    'BMW X 7'
  ];
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocProvider.value(
          value: searchResultBloc,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(76),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToDark,
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(0.1),
                        offset: const Offset(0, 8),
                        blurRadius: 24,
                      ),
                      BoxShadow(
                        color: black.withOpacity(0.1),
                        offset: const Offset(0, -1),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Expanded(
                      //   child:
                      //
                      // ),
                      Expanded(
                        child: RawAutocomplete<String>(
                            textEditingController: searchController,
                            focusNode: focusNode,
                            optionsBuilder: (textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              } else {
                                final matches = <String>[];
                                matches.addAll(searchItemEntity);

                                matches.retainWhere((s) => s
                                    .toLowerCase()
                                    .contains(
                                        textEditingValue.text.toLowerCase()));
                                return matches;
                              }
                            },
                            onSelected: (selection) {
                              print('You just selected $selection');
                            },
                            fieldViewBuilder: (context, textEditingController,
                                    focusNode, onFieldSubmitted) =>
                                WTextField(
                                  fillColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmoke2ToNightRider,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  focusNode: focusNode,
                                  keyBoardType: TextInputType.name,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                  textInputAction: TextInputAction.search,
                                  borderColor: purple,
                                  focusColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmoke2ToNightRider,
                                  enabledBorderColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmoke2ToNightRider,
                                  height: 44,
                                  margin:
                                      const EdgeInsets.fromLTRB(16, 16, 8, 16),
                                  // width: 300,
                                  borderRadius: 12,
                                  controller: textEditingController,
                                  hasSearch: true,
                                  hintText: LocaleKeys.model_brand.tr(),
                                  hasClearButton: true,
                                ),
                            optionsViewBuilder: (context,
                                    void Function(String) onSelected,
                                    options) =>
                                ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: options
                                      .map(
                                        (opt) => SearchedModelsItem(
                                          fullText: opt,
                                          searchText: searchController.text,
                                          onTap: () {
                                            onSelected(opt);
                                          },
                                        ),
                                      )
                                      .toList(),
                                )
                            //     Material(
                            //   child: SizedBox(
                            //     height: 200,
                            //     child: SingleChildScrollView(
                            //       child: Column(
                            //         children: options
                            //             .map(
                            //               (opt) => InkWell(
                            //                 onTap: () {
                            //                   onSelected(opt.toString());
                            //                 },
                            //                 child: Container(
                            //                   padding: const EdgeInsets.only(
                            //                       right: 60),
                            //                   child: Card(
                            //                     child: Container(
                            //                       width: double.infinity,
                            //                       padding:
                            //                           const EdgeInsets.all(10),
                            //                       child: Text(opt.toString()),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             )
                            //             .toList(),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            ),
                      ),
                      Focus(
                        focusNode: focusNode,
                        onFocusChange: (value) {
                          if (searchController.text.isNotEmpty || !value) {
                            setState(() {});
                          }
                        },
                        child: WButton(
                          onTap: () =>
                              sortModalBottomSheet(context, summ, date),
                          width: 44,
                          height: 44,
                          borderRadius: 12,
                          margin: const EdgeInsets.only(left: 10, right: 16),
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmoke2ToNightRider,
                          child: SvgPicture.asset(
                            AppIcons.sort,
                            color: searchController.text.isEmpty ||
                                    focusNode.hasFocus
                                ? greyText
                                : purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SuggestionPage(controller: searchController),
                    PopularSearchesField(
                      title: 'Последние запросы',
                      elements: const [
                        'Gentra 1.5',
                        'Malibu 1.5 Turbo 2021',
                        'BMW X6 M competition',
                      ],
                      hasClearTrailing: true,
                      hasClearButtonInTitle: true,
                    ),
                    PopularSearchesField(
                      title: 'Популярные запросы',
                      elements: const [
                        'Gentra 1.5',
                        'Cobalt',
                        'Nexia 3',
                        'Nexia 3'
                      ],
                    ),
                    WButton(
                      margin: const EdgeInsets.all(24),
                      onTap: () {
                        Navigator.push(
                            context, fade(page: const ParameterScreen()));
                      },
                      text: 'Parameter Screen',
                    ),
                    WButton(
                      margin: const EdgeInsets.all(24),
                      onTap: () {
                        Navigator.push(
                          context,
                          fade(
                              page:
                                  ResultsScreen(controller: searchController)),
                        );
                      },
                      text: 'Results Screen',
                    ),
                    BlocBuilder<SearchResultBloc, SearchResultState>(
                      builder: (context, state) => ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.list.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(
                            height: 12,
                            thickness: 0,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .borderGreyToDark),
                        itemBuilder: (context, index) => InfoResultContainer(
                          avatarPicture: state.list[index].user.image,
                          carModel: state.list[index].carModel.name,
                          hasDiscount: false,
                          location: state.list[index].district.title,
                          owner: state.list[index].user.fullName,
                          ownerType: state.list[index].userType,
                          publishTime: state.list[index].publishedAt,
                          subtitle: state.list[index].description,
                          year: state.list[index].carYear,
                          price: MyFunctions.getFormatCost(
                              state.list[index].price.toString()),
                          discountPrice: state.list[index].price.toString(),
                          sellType: sellType[index],
                          isNew: state.list[index].isNew,
                          isWishlist: state.list[index].isWishlisted,
                        ),
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
