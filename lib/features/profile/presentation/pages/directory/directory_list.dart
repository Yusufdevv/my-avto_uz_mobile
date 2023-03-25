import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_card.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DirectoryList extends StatefulWidget {
  const DirectoryList({Key? key}) : super(key: key);

  @override
  State<DirectoryList> createState() => _DirectoryListState();
}

class _DirectoryListState extends State<DirectoryList>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    context.read<DirectoryBloc>().add(GetDirectoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocBuilder<DirectoryBloc, DirectoryState>(
        builder: (context, state) {
          if (state.status != FormzStatus.submissionSuccess) {
            return const Center(child: CupertinoActivityIndicator());
          } else {
            final directories = state.directories;
            return directories.isNotEmpty
                ? Paginator(
                    hasMoreToFetch: state.fetchMoreDirectories,
                    fetchMoreFunction: () {
                      context
                          .read<DirectoryBloc>()
                          .add(GetMoreDirectoriesEvent());
                    },
                    errorWidget: const SizedBox(),
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 20, bottom: 20),
                    itemBuilder: (context, index) {
                      final item = directories[index];
                      return DirectoryCard(
                        slug: item.slug ?? '',
                        region: item.region ?? '',
                        dealerType:
                            MyFunctions.getCategoriesName(item.category),
                        dealerName: item.name ?? '',
                        phoneNumber: '',
                        dealerInfo: '',
                        dealerImageUrl: item.avatar ?? '',
                        quantityOfCars: 0,
                        latitude: (item.latitude ?? 0).toDouble(),
                        longitude: (item.longitude ?? 0).toDouble(),
                        contractCode: '',
                        contractNumber: '',
                        contactTo: item.contactTo ?? '',
                        contactFrom: item.contactFrom ?? '',
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: directories.length,
                    paginatorStatus: state.status,
                  )
                : Center(
                    child: EmptyItemBody(
                        title: LocaleKeys.no_dealer.tr(),
                        subtitle: '',
                        image: AppIcons.emptyFolder),
                  );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
