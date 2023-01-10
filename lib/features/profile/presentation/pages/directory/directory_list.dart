import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_card_bloc/dealer_card_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_card.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_card.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DirectoryList extends StatefulWidget {
  const DirectoryList({Key? key, this.isDirectoryPage = false})
      : super(key: key);
  final bool isDirectoryPage;

  @override
  State<DirectoryList> createState() => _DirectoryListState();
}

class _DirectoryListState extends State<DirectoryList> {
  late DealerCardBloc dealerCardBloc;

  @override
  void initState() {
    dealerCardBloc = DealerCardBloc(DealerUseCase())
      ..add(DealerCardEvent.getResults(isRefresh: false, search: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: dealerCardBloc,
        child: Scaffold(
          body: BlocBuilder<DealerCardBloc, DealerCardState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              if (state.status == FormzStatus.submissionSuccess) {
                final list = state.list;
                return list.isNotEmpty
                    ? ListView.separated(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 20, bottom: 20),
                        itemBuilder: (context, index) {
                          final item = list[index];
                          return DirectoryCard(
                            //dealerType: item.description,
                            dealerName: item.name,
                            phoneNumber: item.phoneNumber,
                            dealerInfo: item.description,
                            dealerImageUrl: item.avatar,
                            quantityOfCars: item.carCount,
                            latitude: item.latitude,
                            longitude: item.longitude,
                            contractCode:
                                '+998 ${item.phoneNumber.substring(0, 2)}',
                            contractNumber: item.phoneNumber.substring(2, 9),
                            contactTo: item.contactTo,
                            contactFrom: item.contactFrom,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: state.count,
                      )
                    : const Center(
                        child: EmptyItemBody(
                            title: 'Нет уведомлении',
                            subtitle:
                                'Ваши сохранённые поиски будут отображаться в данном разделе.',
                            image: AppIcons.emptyFolder),
                      );
              }
              return const Center(
                child: Text('Xatolik!'),
              );
            },
          ),
        ),
      );
}
