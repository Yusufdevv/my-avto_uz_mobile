import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/my_reviews_screen.dart';
import 'package:auto/features/reviews/presentation/pages/publication_my_review.dart';
import 'package:auto/features/reviews/presentation/pages/reviews_body_screen.dart';
import 'package:auto/features/reviews/presentation/pages/reviews_body_screen.dart';
import 'package:auto/features/reviews/presentation/reviews_screen.dart';
import 'package:auto/features/search/domain/usecases/get_search_result.dart';
import 'package:auto/features/search/presentation/bloc/search_results/search_result_bloc.dart';
import 'package:auto/features/reviews/presentation/pages/select_model_screen.dart';
import 'package:auto/features/search/presentation/pages/parameter_screen.dart';
import 'package:auto/features/search/presentation/pages/results_screen.dart';
import 'package:auto/features/reviews/presentation/pages/select_brand_screen.dart';
import 'package:auto/features/search/presentation/part/sort_modal_bottom_sheet.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:auto/features/search/presentation/widgets/popular_searches_field.dart';
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
                      Expanded(
                        child: WTextField(
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
                                  fontSize: 16, fontWeight: FontWeight.w400),
                          textInputAction: TextInputAction.search,
                          borderColor: purple,
                          focusColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmoke2ToNightRider,
                          enabledBorderColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmoke2ToNightRider,
                          height: 44,
                          margin: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                          // width: 300,
                          borderRadius: 12,
                          controller: searchController,
                          hasSearch: true,
                          hintText: LocaleKeys.model_brand.tr(),
                          hasClearButton: true,
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
                        Navigator.push(context, fade(page: ParameterScreen()));
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
                        itemCount: 2,
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
                          // '\n\nMercedes-Benz Sprinter — семейство малотоннажных\nавтомобилей компании Mercedes-Benz. Существует...',
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
