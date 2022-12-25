import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/storage.dart';
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
import 'package:auto/features/search/presentation/bloc/search_results/search_bloc.dart';
import 'package:auto/features/search/presentation/bloc/user_searches_bloc/user_searches_bloc.dart';
import 'package:auto/features/search/presentation/pages/last_popular_searches_screen.dart';
import 'package:auto/features/search/presentation/pages/loading_screen.dart';
import 'package:auto/features/search/presentation/pages/nothing_found_screen.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:auto/features/search/presentation/widgets/search_item_shimmer.dart';
import 'package:auto/features/search/presentation/widgets/searched_models_item.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
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
  late SearchBloc searchBloc;
  late UserSearchesBloc userSearchesBloc;
  FocusNode focusNode = FocusNode();
  bool isFocused = false;
  SortSearchResultStatus? sortingValue = SortSearchResultStatus.cheapest;
  SearchControllerStatus textControllerStatus = SearchControllerStatus.initial;

  @override
  void initState() {
    searchController = TextEditingController();
    searchBloc = SearchBloc(
        GetSearchResultsUseCase(
            repo: SearchRepositoryImpl(
                dataSource: SearchResultsDatasourceImpl(DioSettings().dio))),
        suggestionUseCase: SuggestionUseCase(
            repo: SuggestionRepositoryImpl(
                dataSource: SuggestionDatasourceImpl(DioSettings().dio))));
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
            BlocProvider(create: (context) => searchBloc),
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
                        child: Focus(
                          focusNode: focusNode,
                          onFocusChange: (value) {
                            isFocused = value;

                            if (!value) {
                              if (searchController.text.isEmpty) {
                                textControllerStatus =
                                    SearchControllerStatus.initial;
                              } else {
                                searchBloc.add(SearchEvent.getResults(
                                    searchText: searchController.text));
                                textControllerStatus =
                                    SearchControllerStatus.completed;
                              }
                            } else {
                              textControllerStatus =
                                  SearchControllerStatus.typing;
                              searchBloc.add(
                                SearchEvent.getSuggestions(
                                    search: searchController.text),
                              );
                            }

                            setState(() {});
                          },
                          child: WTextField(
                            fillColor: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteSmoke2ToNightRider,
                            onChanged: (value) {
                              searchBloc.add(SearchEvent.getSuggestions(
                                  search: searchController.text));
                              setState(() {});
                            },
                            onFieldSubmitted: (v) {
                              if (searchController.text.isNotEmpty) {
                                addSearchToStorage(searchController.text);
                              }
                            },
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
                      ),
                      WButton(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          backgroundColor: LightThemeColors.appBarColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          clipBehavior: Clip.hardEdge,
                          builder: (context) => SortBottomSheet(
                            title: 'Сортировка',
                            values: const [
                              SortSearchResultsModel(
                                title: 'По убыванию',
                                status: SortSearchResultStatus.cheapest,
                              ),
                              SortSearchResultsModel(
                                title: 'По возрастанию',
                                status: SortSearchResultStatus.expensive,
                              ),
                              SortSearchResultsModel(
                                title: 'Сначала старые',
                                status: SortSearchResultStatus.oldest,
                              ),
                              SortSearchResultsModel(
                                title: 'Сначала новые',
                                status: SortSearchResultStatus.newest,
                              ),
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
                    ],
                  ),
                ),
              ),
              body: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) => textControllerStatus ==
                        SearchControllerStatus.typing
                    ? searchController.text.isEmpty
                        ? const SizedBox()
                        : Paginator(
                            fetchMoreFunction: () {},
                            hasMoreToFetch: state.suggestionsFetchMore ?? false,
                            paginatorStatus: state.suggestionsStatus,
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                            errorWidget: const SizedBox(),
                            padding: EdgeInsets.zero,
                            itemCount: state.suggestionsCount,
                            itemBuilder: (context, index) => SearchedModelsItem(
                              imageUrl:
                                  state.suggestions[index].source.carMake.logo,
                              vehicleType:
                                  state.suggestions[index].source.vehicleType,
                              fullText: state
                                  .suggestions[index].source.absoluteCarName,
                              searchText: searchController.text,
                              onTap: () {
                                searchController
                                  ..text = state.suggestions[index].text
                                  ..selection = TextSelection.fromPosition(
                                    TextPosition(
                                        offset: searchController.text.length),
                                  );
                                searchBloc.add(
                                  SearchEvent.getResults(
                                      searchText: searchController.text),
                                );
                                focusNode.unfocus();
                                setState(() {});
                              },
                            ),
                          )
                    : textControllerStatus == SearchControllerStatus.completed
                        ? Column(
                            children: [
                              Expanded(
                                child: state.status !=
                                        FormzStatus.submissionSuccess
                                    ? const LoadingScreen()
                                    : state.searchResults.isEmpty
                                        ? const Center(
                                            child: NothingFoundScreen(),
                                          )
                                        : Paginator(
                                            hasMoreToFetch: state.moreFetch,
                                            fetchMoreFunction: () {},
                                            itemCount: state.count,
                                            paginatorStatus: state.status,
                                            errorWidget:
                                                const SearchItemShimmer(
                                                    slideImageCount: 2),
                                            separatorBuilder:
                                                (context, index) => Divider(
                                              height: 12,
                                              thickness: 0,
                                              color: Theme.of(context)
                                                  .extension<ThemedColors>()!
                                                  .borderGreyToDark,
                                            ),
                                            itemBuilder: (context, index) =>
                                                InfoResultContainer(
                                              discount: state
                                                  .searchResults[index]
                                                  .discount,
                                              callFrom: state
                                                  .searchResults[index]
                                                  .contactAvailableFrom,
                                              callTo: state.searchResults[index]
                                                  .contactAvailableTo,
                                              gallery: state
                                                  .searchResults[index].gallery,
                                              carModelName: state
                                                  .searchResults[index]
                                                  .carModel
                                                  .name,
                                              carYear: state
                                                  .searchResults[index].carYear,
                                              contactPhone: state
                                                  .searchResults[index]
                                                  .contactPhone,
                                              description: state
                                                  .searchResults[index]
                                                  .description,
                                              districtTitle: state
                                                  .searchResults[index]
                                                  .district
                                                  .title,
                                              isNew: state
                                                  .searchResults[index].isNew,
                                              isWishlisted: state
                                                  .searchResults[index]
                                                  .isWishlisted,
                                              price: state
                                                  .searchResults[index].price,
                                              publishedAt: state
                                                  .searchResults[index]
                                                  .publishedAt,
                                              userFullName: state
                                                  .searchResults[index]
                                                  .user
                                                  .fullName,
                                              userImage: state
                                                  .searchResults[index]
                                                  .user
                                                  .image,
                                              userType: state
                                                  .searchResults[index]
                                                  .userType,
                                              hasComparison: state
                                                  .searchResults[index]
                                                  .isComparison,
                                            ),
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
        ),
      );

  void addSearchToStorage(String text) {
    if (StorageRepository.getList('last_searches').isEmpty) {
      StorageRepository.putList('last_searches', [text]);
    } else {
      if (StorageRepository.getList('last_searches').length == 5) {
        StorageRepository.putList(
          'last_searches',
          [...StorageRepository.getList('last_searches'), text],
        );
      } else {
        StorageRepository.putList(
          'last_searches',
          [...StorageRepository.getList('last_searches'), text],
        );
      }
    }
  }
}

void addSearchToStorage(String text) {
  if (StorageRepository.getList('last_searches').isEmpty) {
    StorageRepository.putList('last_searches', [text]);
  } else {
    if (StorageRepository.getList('last_searches').length == 5) {
      StorageRepository.putList(
        'last_searches',
        [...StorageRepository.getList('last_searches'), text],
      );
    } else {
      StorageRepository.putList(
        'last_searches',
        [...StorageRepository.getList('last_searches'), text],
      );
    }
  }
}

class SortSearchResultsModel {
  final String title;
  final SortSearchResultStatus status;
  const SortSearchResultsModel({required this.title, required this.status});
}

enum SortSearchResultStatus {
  cheapest,
  expensive,
  oldest,
  newest,
}

enum SearchControllerStatus {
  typing,
  completed,
  initial,
}
