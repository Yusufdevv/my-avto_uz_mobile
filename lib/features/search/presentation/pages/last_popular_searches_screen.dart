import 'package:auto/features/search/presentation/bloc/user_searches_bloc/user_searches_bloc.dart';
import 'package:auto/features/search/presentation/widgets/popular_searches_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastPopularSearchesScreen extends StatefulWidget {
  final TextEditingController searchController;
  final bool hasFocus;
  const LastPopularSearchesScreen(
      {required this.searchController, required this.hasFocus, super.key});

  @override
  State<LastPopularSearchesScreen> createState() =>
      _LastPopularSearchesScreenState();
}

class _LastPopularSearchesScreenState extends State<LastPopularSearchesScreen> {
  @override
  Widget build(BuildContext context) => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          BlocBuilder<UserSearchesBloc, UserSearchesState>(
            builder: (context, state) => PopularSearchesField(
              textController: widget.searchController,
              hasFocus: widget.hasFocus,
              title: 'Последние запросы',
              elements: state.userSearches.map((e) => e.searchText).toList(),
              hasClearTrailing: true,
              hasClearButtonInTitle: true,
            ),
          ),
          BlocBuilder<UserSearchesBloc, UserSearchesState>(
            builder: (context, state) => PopularSearchesField(
              textController: widget.searchController,
              hasFocus: widget.hasFocus,
              title: 'Популярные запросы',
              elements: state.popularSearches.map((e) => e.searchText).toList(),
            ),
          ),
        ],
      );
}
