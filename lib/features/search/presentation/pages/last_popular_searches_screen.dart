import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/search/presentation/bloc/user_searches_bloc/user_searches_bloc.dart';
import 'package:auto/features/search/presentation/pages/loading_screen.dart';
import 'package:auto/features/search/presentation/widgets/popular_searches_field.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LastPopularSearchesScreen extends StatefulWidget {
  final TextEditingController searchController;
  final FocusNode focusNode;
  const LastPopularSearchesScreen(
      {required this.searchController, required this.focusNode, super.key});

  @override
  State<LastPopularSearchesScreen> createState() =>
      _LastPopularSearchesScreenState();
}

class _LastPopularSearchesScreenState extends State<LastPopularSearchesScreen> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UserSearchesBloc, UserSearchesState>(
        builder: (context, state) =>
            state.status != FormzStatus.submissionSuccess
                ? const Center(child: LoadingScreen())
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      PopularSearchesField(
                        textController: widget.searchController,
                        focusNode: widget.focusNode,
                        title: LocaleKeys.last_requests.tr(),
                        elements: StorageRepository.getList('last_searches')
                            .reversed
                            .toList(),
                        hasClearTrailing: true,
                        hasClearButtonInTitle: true,
                      ),
                      PopularSearchesField(
                        textController: widget.searchController,
                        focusNode: widget.focusNode,
                        title: LocaleKeys.popular_requests.tr(),
                        elements: state.popularSearches
                            .map((e) => e.searchText)
                            .toList(),
                      ),
                    ],
                  ),
      );
}
