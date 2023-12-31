// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'dart:developer';

import 'package:auto/features/ads/presentation/widgets/no_data_widget.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AdsBodyScreen extends StatefulWidget {
  final bool? isNew;
  final AnnouncementListBloc announcementListBloc;
  final bool isFromComparison;

  const AdsBodyScreen({
    required this.announcementListBloc,
    this.isNew,
    this.isFromComparison = false,
    Key? key,
  }) : super(key: key);

  @override
  State<AdsBodyScreen> createState() => _AdsBodyScreenState();
}

class _AdsBodyScreenState extends State<AdsBodyScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.announcementListBloc.add(const GetAnnouncementList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
      value: widget.announcementListBloc,
      child: BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state.status.isSubmissionFailure) {
            return const SizedBox();
          } else if (state.status.isSubmissionSuccess) {
            if (state.announcementList.isNotEmpty) {
              return NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: widget.isFromComparison ? 80 : 0),
                  child: Paginator(
                    padding: const EdgeInsets.only(bottom: 12),
                    physics: const NeverScrollableScrollPhysics(),
                    paginatorStatus: state.status,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (!widget.isFromComparison) {
                          Navigator.of(context, rootNavigator: true)
                              .push(fade(
                                  page: CarSingleScreen(
                                      id: state.announcementList[index].id)))
                              .then((value) {
                            log(':::::::::: the value ${value.toString()}  ::::::::::');
                            if (value != null && value) {
                              context
                                  .read<AnnouncementListBloc>()
                                  .add(const GetAnnouncementList());
                            }
                          });
                        }
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InfoContainer(
                          isFromComparison: widget.isFromComparison,
                          index: index,
                          phone: state.announcementList[index].userType ==
                                  'owner'
                              ? state.announcementList[index].user.phoneNumber
                              : state
                                  .announcementList[index].dealer.phoneNumber,
                          avatarPicture:
                              state.announcementList[index].user.image,
                          carModel:
                              '${state.announcementList[index].make} ${state.announcementList[index].model} ${state.announcementList[index].generation.name}',
                          hasDiscount:
                              state.announcementList[index].discount != 0,
                          location: state.announcementList[index].region.title,
                          owner:
                              state.announcementList[index].user.name.isNotEmpty
                                  ? state.announcementList[index].user.name
                                  : state.announcementList[index].user.fullName,
                          ownerType: state.announcementList[index].userType,
                          publishTime: MyFunctions.getDateNamedMonthEdit(
                              state.announcementList[index].publishedAt),
                          subtitle: state.announcementList[index].description,
                          year: state.announcementList[index].year,
                          price: state.announcementList[index].price,
                          discountPrice:
                              state.announcementList[index].discount ?? 0,
                          sellType:
                              state.announcementList[index].isRentWithPurchase
                                  ? LocaleKeys.rent_to_buy.tr()
                                  : LocaleKeys.car_sale.tr(),
                          hasStatusInfo: state.announcementList[index].isNew,
                          gallery: state.announcementList[index].gallery,
                          currency: state.announcementList[index].currency,
                          initialLike:
                              state.announcementList[index].isWishlisted,
                          id: state.announcementList[index].id,
                          onTapFavorites: () {
                            /// tegma, ichkarida AddWishlistItemda function-i yozilgan
                          },
                          initialComparsions:
                              state.announcementList[index].isComparison,
                        ),
                      ),
                    ),
                    itemCount: state.announcementList.length,
                    fetchMoreFunction: () {
                      widget.announcementListBloc
                          .add(const GetMoreAnnouncementList());
                    },
                    hasMoreToFetch: state.next,
                    errorWidget: const SizedBox(),
                  ),
                ),
              );
            } else {
              return const NoDataWidget();
            }
          }
          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
