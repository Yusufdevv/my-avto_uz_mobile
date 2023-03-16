import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_card_bloc/dealer_card_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/dealer_single_page.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_card.dart';
import 'package:auto/features/dealers/presentation/widgets/dealers_empty_state.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DealersList extends StatefulWidget {
  const DealersList({Key? key}) : super(key: key);

  @override
  State<DealersList> createState() => _DealersListState();
}

class _DealersListState extends State<DealersList>
    with AutomaticKeepAliveClientMixin {
  void onTap(String slug) {
    Navigator.of(context, rootNavigator: true)
        .push(fade(page: DealerSinglePage(slug: slug)));
  }

  @override
  void initState() {
    context.read<DealerCardBloc>().add(DealerCardEvent.getResults(
        isRefresh: false,
        search: '',
        onSuccess: (list) {
          context.read<MapOrganizationBloc>().add(
              MapOrganizationEvent.setMapPoints(
                  list: list
                      .map((e) => DealerCardModel.fromJson(
                          const DealerCardConvert().toJson(e)))
                      .toList()));
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocBuilder<DealerCardBloc, DealerCardState>(
          builder: (context, state) {
        if (state.status != FormzStatus.submissionSuccess) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else {
          if (state.list.isNotEmpty) {
            return Paginator(
              paginatorStatus: state.paginationStatus,
              fetchMoreFunction: () {
                context
                    .read<DealerCardBloc>()
                    .add(DealerCardEvent.getMoreResults());
              },
              hasMoreToFetch: state.next != null,
              errorWidget: const SizedBox(),
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: DealerCard(
                  dealerId: state.list[index].id,
                  onTap: () => onTap(state.list[index].slug),
                  dealerName: state.list[index].name,
                  phoneNumber: state.list[index].phoneNumber,
                  dealerInfo: state.list[index].description,
                  dealerImageUrl: state.list[index].avatar,
                  quantityOfCars: state.list[index].carCount,
                  latitude: state.list[index].latitude,
                  longitude: state.list[index].longitude,
                  contractCode:
                      '+998 ${state.list[index].phoneNumber.substring(4, 6)}',
                  contractNumber: state.list[index].phoneNumber.substring(6),
                  contactTo: state.list[index].contactTo,
                  contactFrom: state.list[index].contactFrom,
                  isAllDay: state.list[index].isWorkingAllDays,
                  workingDaysList: state.list[index].workingDays,
                ),
              ),
              itemCount: state.list.length,
            );
          } else {
            return const EmptyState();
          }
        }
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
