import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/reviews_screen.dart';
import 'package:auto/features/search/data/datasources/popular_searches_datasource.dart';
import 'package:auto/features/search/data/datasources/suggestion_datasource.dart';
import 'package:auto/features/search/data/datasources/user_searches_datasource.dart';
import 'package:auto/features/search/data/repositories/popular_searches_repository.dart';
import 'package:auto/features/search/data/repositories/suggestion_repository.dart';
import 'package:auto/features/search/data/repositories/user_searches_repository_impl.dart';
import 'package:auto/features/search/domain/usecases/get_search_result_usecase.dart';
import 'package:auto/features/search/domain/usecases/popular_searches_usecase.dart';
import 'package:auto/features/search/domain/usecases/suggestion_usecase.dart';
import 'package:auto/features/search/domain/usecases/user_searches_usecase.dart';
import 'package:auto/features/search/presentation/bloc/search_results/search_result_bloc.dart';
import 'package:auto/features/search/presentation/bloc/suggestion/suggestion_bloc.dart';
import 'package:auto/features/search/presentation/bloc/user_searches_bloc/user_searches_bloc.dart';
import 'package:auto/features/search/presentation/part/popular_searches_field.dart';
import 'package:auto/features/search/presentation/part/sort_modal_bottom_sheet.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:auto/features/search/presentation/widgets/search_item_shimmer.dart';
import 'package:auto/features/search/presentation/widgets/searched_models_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  late SearchResultBloc searchResultBloc;
  late SuggestionBloc suggestionBloc;
  late UserSearchesBloc userSearchesBloc;
  FocusNode focusNode = FocusNode();
  final List<bool> hasDiscount = [true, false];
  final List<String> owner = ['Анвар Гулямов', 'ORIENT MOTORS'];
  final List<String> ownerType = ['Частное лицо', 'Автосалон'];
  final List<String> publishTime = ['Сегодня', '27 февраля'];
  final List<String> sellType = ['Продажа Автомобиля', 'Аренда c выкупом'];

  @override
  void initState() {
    suggestionBloc = SuggestionBloc(
        useCase: SuggestionUseCase(
            repo: SuggestionRepositoryImpl(
                dataSource: SuggestionDatasourceImpl(DioSettings().dio))));
    searchController = TextEditingController();
    searchResultBloc = SearchResultBloc(GetSearchResultsUseCase());
    userSearchesBloc = UserSearchesBloc(
        useCase: UserSearchesUseCase(
            repo: UserSearchesRepositoryImpl(
                dataSource: UserSearchesDatasourceImpl(DioSettings().dio))),
        popularSearchesUseCase: PopularSearchesUseCase(
            repo: PopularSearchesRepositoryImpl(
                dataSource: PopularSearchesSourceImpl(DioSettings().dio))))
      ..add(UserSearchesEvent.getUserSearches())
      ..add(UserSearchesEvent.getPopularSearches());
    super.initState();
  }

  @override
  void dispose() {
    searchController
      ..dispose()
      ..clear();
    searchResultBloc.close();
    suggestionBloc.close();
    userSearchesBloc.close();
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
  ];
  final List<String> lastSearches = [
    'BMW Xdrive',
    'BMW X5 sport',
    'BMW X6 Competition',
    'BMW X 7',
  ];
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => suggestionBloc),
            BlocProvider(create: (context) => searchResultBloc),
            BlocProvider(create: (context) => userSearchesBloc),
          ],
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
                            suggestionBloc.add(SuggestionEvent.getSuggestions(
                                search: searchController.text));
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
                    BlocBuilder<SuggestionBloc, SuggestionState>(
                      builder: (context, state) => ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: state.suggestions
                            .absoluteCarNameSuggestCompletion.length,
                        itemBuilder: (context, index) =>
                            state.status != FormzStatus.submissionSuccess ||
                                    state
                                        .suggestions
                                        .absoluteCarNameSuggestCompletion
                                        .isEmpty
                                ? const SizedBox()
                                : SearchedModelsItem(
                                    fullText: state
                                        .suggestions
                                        .absoluteCarNameSuggestCompletion[index]
                                        .options[index]
                                        .source
                                        .absoluteCarName,
                                    searchText: searchController.text,
                                    onTap: () {
                                      focusNode.unfocus();
                                    },
                                  ),
                      ),
                    ),
                    WButton(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(fade(page: const ReviewsScreen()));
                      },
                      textColor: white,
                      child: const Text('Review'),
                    ),
                    BlocBuilder<UserSearchesBloc, UserSearchesState>(
                      builder: (context, state) => PopularSearchesField(
                        textController: searchController,
                        title: 'Последние запросы',
                        elements: state.userSearches
                            .map((e) => e.searchText)
                            .toList(),
                        hasClearTrailing: true,
                        hasClearButtonInTitle: true,
                      ),
                    ),
                    BlocBuilder<UserSearchesBloc, UserSearchesState>(
                      builder: (context, state) => PopularSearchesField(
                        textController: searchController,
                        title: 'Популярные запросы',
                        elements: state.popularSearches
                            .map((e) => e.searchText)
                            .toList(),
                      ),
                    ),
                    const SearchItemShimmer(slideImageCount: 4),
                    Column(
                      children: [
                        BlocListener<SearchResultBloc, SearchResultState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          child: Container(),
                        ),
                        // BlocBuilder<SearchResultBloc, SearchResultState>(
                        //   builder: (context, state) => ListView.separated(
                        //     physics: const BouncingScrollPhysics(),
                        //     itemCount: state.list.length,
                        //     shrinkWrap: true,
                        //     separatorBuilder: (context, index) => Divider(
                        //       height: 12,
                        //       thickness: 0,
                        //       color: Theme.of(context)
                        //           .extension<ThemedColors>()!
                        //           .borderGreyToDark,
                        //     ),
                        //     itemBuilder: (context, index) =>
                        //         InfoResultContainer(
                        //             commercialItemEntity: state.list[index]),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
