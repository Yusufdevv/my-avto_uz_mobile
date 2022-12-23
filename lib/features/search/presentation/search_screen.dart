import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/search/data/datasources/popular_searches_datasource.dart';
import 'package:auto/features/search/data/datasources/search_results_datasource.dart';
import 'package:auto/features/search/data/datasources/suggestion_datasource.dart';
import 'package:auto/features/search/data/datasources/user_searches_datasource.dart';
import 'package:auto/features/search/data/repositories/popular_searches_repository.dart';
import 'package:auto/features/search/data/repositories/search_repository.dart';
import 'package:auto/features/search/data/repositories/suggestion_repository.dart';
import 'package:auto/features/search/data/repositories/user_searches_repository_impl.dart';
import 'package:auto/features/search/domain/usecases/get_search_result_usecase.dart';
import 'package:auto/features/search/domain/usecases/popular_searches_usecase.dart';
import 'package:auto/features/search/domain/usecases/suggestion_usecase.dart';
import 'package:auto/features/search/domain/usecases/user_searches_usecase.dart';
import 'package:auto/features/search/presentation/bloc/search_results/search_result_bloc.dart';
import 'package:auto/features/search/presentation/bloc/suggestion/suggestion_bloc.dart';
import 'package:auto/features/search/presentation/bloc/user_searches_bloc/user_searches_bloc.dart';
import 'package:auto/features/search/presentation/pages/last_popular_searches_screen.dart';
import 'package:auto/features/search/presentation/pages/loading_screen.dart';
import 'package:auto/features/search/presentation/pages/nothing_found_screen.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:auto/features/search/presentation/widgets/search_item_shimmer.dart';
import 'package:auto/features/search/presentation/widgets/searched_models_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'widgets/sort_bottom_sheet.dart';

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
  bool isFocused = false;
  String? sortingValue = 'cheapest';

  @override
  void initState() {
    suggestionBloc = SuggestionBloc(
        useCase: SuggestionUseCase(
            repo: SuggestionRepositoryImpl(
                dataSource: SuggestionDatasourceImpl(DioSettings().dio))));
    searchController = TextEditingController();
    searchResultBloc = SearchResultBloc(GetSearchResultsUseCase(
        repo: SearchRepositoryImpl(
            dataSource: SearchResultsDatasourceImpl(DioSettings().dio))));
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
                          onFieldSubmitted: (v) {
                            searchResultBloc.add(
                                SearchResultEvent.getResults(searchText: v));
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
                          hintText: 'Марка, Модель',
                          hasClearButton: true,
                        ),
                      ),
                      Focus(
                        focusNode: focusNode,
                        onFocusChange: (value) {
                          if (searchController.text.isNotEmpty || !value) {
                            setState(() {
                              isFocused = value;
                            });
                          }
                        },
                        child: WButton(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            backgroundColor: LightThemeColors.appBarColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            clipBehavior: Clip.hardEdge,
                            builder: (context) => SortBottomSheet(
                              title: 'Сортировка',
                              values: const [
                                'cheapest',
                                'most expensive',
                                'oldest',
                                'newest'
                              ],
                              onChanged: (value) =>
                                  setState(() => sortingValue = value),
                              defaultValue: sortingValue,
                            ),
                          ),
                          width: 44,
                          height: 44,
                          borderRadius: 12,
                          margin: const EdgeInsets.only(left: 10, right: 16),
                          color: lavender,
                          child: SvgPicture.asset(
                            AppIcons.arrowsSort,
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                            color: sortingValue == null ? greyText : purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: searchController.text.isNotEmpty
                  ? isFocused
                      ? BlocBuilder<SuggestionBloc, SuggestionState>(
                          builder: (context, state) => Visibility(
                            visible:
                                state.status == FormzStatus.submissionSuccess ||
                                    state.suggestions.isNotEmpty ||
                                    isFocused,
                            child: Paginator(
                              fetchMoreFunction: () {},
                              hasMoreToFetch: state.fetchMore ?? false,
                              paginatorStatus: state.status,
                              separatorBuilder: (context, index) => SizedBox(),
                              errorWidget: SizedBox(),
                              padding: EdgeInsets.zero,
                              itemCount: state.suggestions.length,
                              itemBuilder: (context, index) =>
                                  SearchedModelsItem(
                                imageUrl: state.suggestions[index].logo,
                                fullText: state.suggestions[index].name,
                                searchText: searchController.text,
                                onTap: () {
                                  searchController
                                    ..text = state.suggestions[index].name
                                    ..selection = TextSelection.fromPosition(
                                        TextPosition(
                                            offset:
                                                searchController.text.length));
                                  // focusNode.unfocus();
                                  searchResultBloc.add(
                                    SearchResultEvent.getResults(
                                        searchText: searchController.text),
                                  );
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: BlocBuilder<SearchResultBloc,
                                  SearchResultState>(
                                builder: (context, state) {
                                  if (state.status !=
                                      FormzStatus.submissionSuccess) {
                                    return const LoadingScreen();
                                  } else {
                                    if (state.list.isEmpty) {
                                      return const Center(
                                        child: NothingFoundScreen(),
                                      );
                                    } else {
                                      return Paginator(
                                        hasMoreToFetch: state.moreFetch,
                                        fetchMoreFunction: () {},
                                        itemCount: state.list.length,
                                        paginatorStatus: state.status,
                                        errorWidget: const SearchItemShimmer(
                                            slideImageCount: 2),
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                          height: 12,
                                          thickness: 0,
                                          color: Theme.of(context)
                                              .extension<ThemedColors>()!
                                              .borderGreyToDark,
                                        ),
                                        itemBuilder: (context, index) =>
                                            InfoResultContainer(
                                          callFrom: '',
                                          callTo: '',
                                          gallery: state.list[index].gallery,
                                          carModelName:
                                              state.list[index].carModel.name,
                                          carYear: state.list[index].carYear,
                                          contactPhone:
                                              state.list[index].contactPhone,
                                          description:
                                              state.list[index].description,
                                          districtTitle:
                                              state.list[index].district.title,
                                          isNew: state.list[index].isNew,
                                          isWishlisted:
                                              state.list[index].isWishlisted,
                                          price: state.list[index].price,
                                          publishedAt:
                                              state.list[index].publishedAt,
                                          userFullName:
                                              state.list[index].user.fullName,
                                          userImage:
                                              state.list[index].user.image,
                                          userType: state.list[index].userType,
                                          hasComparison:
                                              state.list[index].isComparison,
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                  : LastPopularSearchesScreen(
                      searchController: searchController,
                      hasFocus: isFocused,
                    ),
            ),
          ),
        ),
      );
}
