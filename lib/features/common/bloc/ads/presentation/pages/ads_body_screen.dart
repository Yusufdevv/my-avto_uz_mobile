import 'package:auto/assets/themes/light.dart';
import 'package:auto/features/common/bloc/ads/presentation/widgets/ads_item_shimmer.dart';
import 'package:auto/features/common/bloc/ads/presentation/widgets/no_data_widget.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/main/presentation/widgets/ads_shimmer.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AdsBodyScreen extends StatefulWidget {
  final bool? isNew;
  const AdsBodyScreen({this.isNew, super.key});

  @override
  State<AdsBodyScreen> createState() => _AdsBodyScreenState();
}

class _AdsBodyScreenState extends State<AdsBodyScreen> {
  @override
  void initState() {
    context.read<AnnouncementListBloc>().add(AnnouncementListEvent.getFilter(
        context.read<AnnouncementListBloc>().state.filter.copyWith(
              isNew: widget.isNew,
            )));
    context
        .read<AnnouncementListBloc>()
        .add(AnnouncementListEvent.getAnnouncementList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
        builder: (context, state) {
          final list =
              List<AnnouncementListEntity>.from(state.announcementList);
          if (state.announcementList.isNotEmpty ||
              state.status == FormzStatus.submissionInProgress) {
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: Paginator(
                physics: const NeverScrollableScrollPhysics(),
                paginatorStatus: state.status,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(fade(
                          page: CarSingleScreen(
                              id: state.announcementList[index].id)));
                    },
                    child: InfoContainer(
                      index: index,
                      phone: state.announcementList[index].userType == 'owner'
                          ? state.announcementList[index].user.phoneNumber
                          : state.announcementList[index].dealer.phoneNumber,
                      avatarPicture: state.announcementList[index].user.avatar,
                      carModel: state.announcementList[index].model,
                      hasDiscount: state.announcementList[index].discount != 0,
                      location: state.announcementList[index].region,
                      owner: state.announcementList[index].user.name.isNotEmpty
                          ? state.announcementList[index].user.name
                          : state.announcementList[index].user.fullName,
                      ownerType: state.announcementList[index].userType,
                      publishTime: MyFunctions.getDateNamedMonthEdit(
                          state.announcementList[index].publishedAt),
                      subtitle: state.announcementList[index].description,
                      year: state.announcementList[index].year,
                      price: MyFunctions.getFormatCost(
                          state.announcementList[index].price.toString()),
                      discountPrice: state.announcementList[index].discount == 0
                          ? ''
                          : state.announcementList[index].discount.toString(),
                      sellType: '',
                      hasStatusInfo: state.announcementList[index].isNew,
                      gallery: state.announcementList[index].gallery,
                      currency: state.announcementList[index].currency,
                      initialLike: list[index].isWishlisted,
                      id: state.announcementList[index].id,
                      onTapComparsion: () {},
                      onTapFavorites: () {},
                      initialComparsions: list[index].isComparison,
                    ),
                  ),
                ),
                itemCount: state.announcementList.length,
                fetchMoreFunction: () {
                  print('===> ==> Qale ${state.next}');
                },
                hasMoreToFetch: state.next != null,
                errorWidget: const Text('Error'),
                loadingWidget: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: AdsShimmerItem(),
                  ),
                  itemCount: 3,
                ),
              ),
            );
          } else {
            return const NoDataWidget();
          }
        },
      );
}
