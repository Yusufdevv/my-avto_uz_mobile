import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_card.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class DirectoryList extends StatefulWidget {
  const DirectoryList({Key? key}) : super(key: key);

  @override
  State<DirectoryList> createState() => _DirectoryListState();
}

class _DirectoryListState extends State<DirectoryList> {
  @override
  void initState() {
    context.read<DirectoryBloc>().add(GetDirectoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<DirectoryBloc, DirectoryState>(
          builder: (context, state) {
            if (state.status.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state.status.isSubmissionSuccess) {
              final directories = state.directories;
              return directories.isNotEmpty
                  ? ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 20, bottom: 20),
                      itemBuilder: (context, index) {
                        final item = directories[index];
                        return DirectoryCard(
                          slug: item.slug!,
                          region: item.region!,
                          dealerType: item.category!.name!,
                          dealerName: item.name!,
                          phoneNumber: '',
                          dealerInfo: '',
                          dealerImageUrl: item.avatar!,
                          quantityOfCars: 0,
                          latitude: item.latitude!,
                          longitude: item.longitude!,
                          contractCode: '',
                          contractNumber: '',
                          contactTo: item.contactTo!,
                          contactFrom: item.contactFrom!,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: directories.length,
                    )
                  :   Center(
                      child: EmptyItemBody(
                          title: LocaleKeys.no_dealer.tr(),
                          subtitle: '',
                          image: AppIcons.emptyFolder),
                    );
            }
            return const Center(child: Text(''));
          },
        ),
      );
}
// Paginator(
//                     itemBuilder: (BuildContext context, int index) {
//                       return TeachersItem(entity: state.entity.results[index]);
//                     },
//                     paginatorStatus: state.status,
//                     itemCount: state.entity.results.length,
//                     hasMoreToFetch: state.fetchMore,
//                     errorWidget: const SizedBox(),
//                     fetchMoreFunction: () {},
//                     loadingWidget: const MainSchoolPageShimmer(),
//                   ),

// Paginator(
//                                             hasMoreToFetch: state.moreFetch,
//                                             fetchMoreFunction: () {},
//                                             itemCount: state.count,
//                                             paginatorStatus: state.status,
//                                             errorWidget:
//                                                 const SearchItemShimmer(
//                                                     slideImageCount: 2),
//                                             separatorBuilder:
//                                                 (context, index) => Divider(
//                                               height: 12,
//                                               thickness: 0,
//                                               color: Theme.of(context)
//                                                   .extension<ThemedColors>()!
//                                                   .borderGreyToDark,
//                                             ),
//                                             itemBuilder: (context, index) =>
//                                                 SortResultsCard(
//                                               searchResults:
//                                                   state.searchResults,
//                                               index: index,
//                                               status: sortingValue,
//                                             ),
//                                           ),