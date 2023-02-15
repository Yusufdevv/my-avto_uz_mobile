import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ads/presentation/widgets/filter_bottom_sheet.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/profile/domain/entities/dealer_type_entity.dart';
import 'package:auto/features/search/presentation/bloc/search_results/search_bloc.dart';
import 'package:auto/features/search/presentation/bloc/user_searches_bloc/user_searches_bloc.dart';
import 'package:auto/features/search/presentation/pages/last_popular_searches_screen.dart';
import 'package:auto/features/search/presentation/pages/loading_screen.dart';
import 'package:auto/features/search/presentation/pages/nothing_found_screen.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:auto/features/search/presentation/widgets/search_item_shimmer.dart';
import 'package:auto/features/search/presentation/widgets/searched_models_item.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
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
  late SearchBloc searchBloc;
  late UserSearchesBloc userSearchesBloc;

  FocusNode focusNode = FocusNode();
  bool isFocused = false;
  SortStatus sortingValue = SortStatus.cheapest;
  SearchControllerStatus textControllerStatus = SearchControllerStatus.initial;

  @override
  void initState() {
    searchController = TextEditingController();
    searchBloc = SearchBloc();
    userSearchesBloc = UserSearchesBloc()
      ..add(UserSearchesEvent.getUserSearches())
      ..add(UserSearchesEvent.getPopularSearches());

    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        if (!isFocused) {
          searchBloc
              .add(SearchEvent.getResults(searchText: searchController.text));
          textControllerStatus = SearchControllerStatus.completed;
        } else {
          textControllerStatus = SearchControllerStatus.typing;
          searchBloc.add(
            SearchEvent.getSuggestions(search: searchController.text),
          );
        }
      } else {
        textControllerStatus = SearchControllerStatus.initial;
      }
      setState(() {});
    });
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
            child: BlocConsumer<SearchBloc, SearchState>(
              listener: (context, state) {},
              builder: (context, state) => Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(76),
                  child: Container(
                    alignment: Alignment.center,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Focus(
                            focusNode: focusNode,
                            onFocusChange: (value) {
                              print('=======onfocus ${value}');

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
                                searchBloc.add(SearchEvent.getSuggestions(
                                    search: searchController.text));
                              }
                              setState(() {});
                            },
                            child: WTextField(
                              height: 44,
                              fillColor: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteSmoke2ToNightRider,
                              onChanged: (value) {
                                print('======= onchanged');

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
                                  .titleMedium!
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
                              margin: const EdgeInsets.only(left: 16, top: 16),
                              borderRadius: 12,
                              controller: searchController,
                              hasSearch: true,
                              hintText: LocaleKeys.model_brand.tr(),
                              hasClearButton: true,
                            ),
                          ),
                        ),
                        WButton(
                          onTap: () => filterBottomSheet(
                            context,
                            onChanged: (value) => searchBloc.add(
                                SearchEvent.setSortStatus(sortStatus: value)),
                            sortingValue: state.sortStatus,
                          ),
                          width: 44,
                          height: 44,
                          borderRadius: 12,
                          margin: const EdgeInsets.only(left: 10, right: 16),
                          color: lavender,
                          child: SvgPicture.asset(AppIcons.arrowsSort,
                              height: 24,
                              width: 24,
                              fit: BoxFit.cover,
                              color: purple),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Builder(
                  builder: (context) => textControllerStatus ==
                          SearchControllerStatus.typing
                      ? searchController.text.isEmpty
                          ? const SizedBox()
                          : searchController.text.isNotEmpty &&
                                  state.suggestions.isEmpty
                              ? const NothingFoundScreen()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Paginator(
                                    fetchMoreFunction: () {},
                                    hasMoreToFetch:
                                        state.suggestionsFetchMore ?? false,
                                    paginatorStatus: state.suggestionsStatus,
                                    separatorBuilder: (context, index) =>
                                        (index != state.suggestionsCount - 1)
                                            ? const Divider(height: 1)
                                            : const SizedBox(),
                                    errorWidget: const SizedBox(),
                                    padding: EdgeInsets.zero,
                                    itemCount: state.suggestionsCount,
                                    itemBuilder: (context, index) =>
                                        SearchedModelsItem(
                                      imageUrl: state.suggestions[index].source
                                          .carMake.logo,
                                      vehicleType: state.suggestions[index]
                                          .source.vehicleType,
                                      fullText: state.suggestions[index].source
                                          .absoluteCarName,
                                      searchText: searchController.text,
                                      onTap: () {
                                        searchController
                                          ..text = state.suggestions[index].text
                                          ..selection =
                                              TextSelection.fromPosition(
                                            TextPosition(
                                                offset: searchController
                                                    .text.length),
                                          );
                                        searchBloc.add(
                                          SearchEvent.getResults(
                                              searchText:
                                                  searchController.text),
                                        );
                                        addSearchToStorage(
                                            searchController.text);
                                        focusNode.unfocus();
                                        // setState(() {});
                                      },
                                    ),
                                  ),
                                )
                      : textControllerStatus == SearchControllerStatus.completed
                          ? state.status != FormzStatus.submissionSuccess
                              ? const LoadingScreen()
                              : state.searchResults.isEmpty
                                  ? const Center(
                                      child: NothingFoundScreen(),
                                    )
                                  : Paginator(
                                      hasMoreToFetch: state.moreFetch,
                                      fetchMoreFunction: () {
                                        searchBloc.add(
                                            SearchEvent.getMoreResults(
                                                searchText:
                                                    searchController.text));
                                      },
                                      itemCount: state.searchResults.length,
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
                                            currency: state
                                                .searchResults[index].currency,
                                            discount: state
                                                .searchResults[index].discount,
                                            callFrom: state.searchResults[index]
                                                .contactAvailableFrom,
                                            callTo: state.searchResults[index]
                                                .contactAvailableTo,
                                            gallery: state
                                                .searchResults[index].gallery,
                                            carModelName: state
                                                .searchResults[index]
                                                .model
                                                .name,
                                            carYear:
                                                state.searchResults[index].year,
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
                                                        .userType !=
                                                    'owner'
                                                ? DealerFavEntity.fromJson(state
                                                            .searchResults[
                                                                index]
                                                            .dealer)
                                                        .avatar ??
                                                    ''
                                                : state.searchResults[index]
                                                    .user.image,
                                            userType: state
                                                .searchResults[index].userType,
                                            hasComparison: state
                                                .searchResults[index]
                                                .isComparison,
                                            id: state.searchResults[index].id,
                                            index: index,
                                          ))
                          : LastPopularSearchesScreen(
                              searchController: searchController,
                              focusNode: focusNode,
                            ),
                ),
              ),
            ),
          ),
        ),
      );
}

void addSearchToStorage(String text) {
  if (StorageRepository.getList('last_searches').isEmpty) {
    StorageRepository.putList('last_searches', [text]);
  } else {
    final list = StorageRepository.getList('last_searches');
    if (!list.contains(text)) {
      if (list.length >= 5) {
        final newList = StorageRepository.getList('last_searches')..removeAt(0);
        StorageRepository.putList('last_searches', [...newList, text]);
      } else {
        StorageRepository.putList(
          'last_searches',
          [...StorageRepository.getList('last_searches'), text],
        );
      }
    } else {
      final newList = StorageRepository.getList('last_searches')..remove(text);
      StorageRepository.putList('last_searches', [...newList, text]);
    }
  }
}

class SortSearchResultsModel {
  final String title;
  final SortStatus status;

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
