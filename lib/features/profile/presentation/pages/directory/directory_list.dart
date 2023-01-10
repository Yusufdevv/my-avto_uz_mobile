import 'package:auto/assets/constants/icons.dart';

import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_card.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 20, bottom: 20),
                  itemBuilder: (context, index) {
                    final item = directories[index];
                    return DirectoryCard(
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
              : const Center(
                  child: EmptyItemBody(
                      title: 'Нет уведомлении',
                      subtitle:
                          'Ваши сохранённые поиски будут отображаться в данном разделе.',
                      image: AppIcons.emptyFolder),
                );
        }
        return const Center(child: Text(''));
      },
    ),
  );
}
