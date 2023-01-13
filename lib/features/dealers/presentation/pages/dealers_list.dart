import 'package:auto/features/dealers/presentation/blocs/dealer_card_bloc/dealer_card_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/seller.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_card.dart';
import 'package:auto/features/dealers/presentation/widgets/dealers_empty_state.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DealersList extends StatefulWidget {
  const DealersList(
      {Key? key, required this.searchedText, this.isDirectoryPage = false})
      : super(key: key);
  final bool isDirectoryPage;
  final String searchedText;

  @override
  State<DealersList> createState() => _DealersListState();
}

class _DealersListState extends State<DealersList> {

  void onTap(String slug) {
    Navigator.push(context, fade(page: Seller(slug: slug)));
  }

  @override
  void initState() {
    context.read<DealerCardBloc>().add(DealerCardEvent.getResults(isRefresh: false, search: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<DealerCardBloc, DealerCardState>(
            builder: (context, state) {
          if (state.status != FormzStatus.submissionSuccess) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            if (state.list.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: DealerCard(
                          //dealerType: state.list[index].description,
                          onTap: () => onTap(state.list[index].slug),
                          dealerName: state.list[index].name,
                          phoneNumber: state.list[index].phoneNumber,
                          dealerInfo: state.list[index].description,
                          dealerImageUrl: state.list[index].avatar,
                          quantityOfCars: state.list[index].carCount,
                          latitude: state.list[index].latitude,
                          longitude: state.list[index].longitude,
                          contractCode:
                              '+998 ${state.list[index].phoneNumber.substring(0, 2)}',
                          contractNumber:
                              state.list[index].phoneNumber.substring(2, 9),
                          contactTo: state.list[index].contactTo,
                          contactFrom: state.list[index].contactFrom,
                          isDirectoryPage: widget.isDirectoryPage,
                        ),
                      ),
                itemCount: state.count,
              );
            } else {
              return dealersEmptyState();
            }
          }
        }),
      );
}
