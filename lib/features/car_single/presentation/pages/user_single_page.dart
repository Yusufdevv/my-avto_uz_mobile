import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/bloc/user_single_bloc/user_single_bloc.dart';
import 'package:auto/features/common/widgets/maps_list_in_app.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_widget.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_single_info_part.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_sliver_delegete.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

// ignore: must_be_immutable
class UserSinglePage extends StatefulWidget {
  //final String dealerType;
  final int userId;
  final int announcementId;

  const UserSinglePage({
    //required this.dealerType,
    required this.userId,
    required this.announcementId,
  });

  @override
  State<UserSinglePage> createState() => _UserSinglePageState();
}

class _UserSinglePageState extends State<UserSinglePage> {
  late UserSingleBloc userSingleBloc;

  @override
  void initState() {
    userSingleBloc = UserSingleBloc()
      ..add(UserSingleEvent.getUserSingle(
          userId: widget.userId, announcementId: widget.announcementId))
      ..add(UserSingleEvent.getUserAds(userId: widget.userId));

    super.initState();
  }

  late YandexMapController controller;

  Future<void> openMapsSheet(
      BuildContext context, double lat, double long, String title) async {
    final coords = Coords(lat, long);
    final availableMaps = await MapLauncher.installedMaps;

    await showModalBottomSheet(
      context: context,
      builder: (context) => MapsListInApp(
          availableMaps: availableMaps, coords: coords, title: title),
    );
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: userSingleBloc,
        child: Scaffold(
          body: BlocBuilder<UserSingleBloc, UserSingleState>(
            builder: (context, state) {
              if (state.status.isSubmissionSuccess) {
                const Center(child: CupertinoActivityIndicator());
              }
              if (state.status.isSubmissionSuccess) {
                final item = state.userSingleEntity;
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: DirectorySliverDelegate(
                          isUserSingle: true,
                          gallery: item.announcement?.gallery ?? [],
                          avatarImage: item.user?.image ?? '',
                          name: item.announcement?.contactName ?? '',
                          minHeight: 100,
                          category: LocaleKeys.private_person.tr()),
                    ),
                  ],
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 16, right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteToNero,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .solitude2ToNightRider,
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.about_dealer.tr(),
                                    style: const TextStyle(
                                        color: orange,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 16),
                                  if (item.announcement?.contactAvailableFrom !=
                                      '')
                                    DeaelerInfoWidget(
                                        text:
                                            '${LocaleKeys.every_day.tr()}, ${item.announcement?.contactAvailableFrom?.substring(0, 5)} - ${item.announcement?.contactAvailableTo?.substring(0, 5)}',
                                        icon: AppIcons.clock),
                                  if (item.announcement?.latitude != 0.0 ||
                                      item.announcement?.longitude != 0.0)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 16),
                                        MapBox(
                                          latitude:
                                              item.announcement?.latitude ?? 0,
                                          longitude:
                                              item.announcement?.longitude ?? 0,
                                          dealerName:
                                              item.announcement?.contactName ??
                                                  '',
                                          dealerId: 99,
                                        )
                                      ],
                                    ),
                                  if (item.announcement?.contactPhone != '')
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: DeaelerInfoWidget(
                                        onTap: () {
                                          launchUrl(Uri.parse(
                                              'tel: ${item.announcement?.contactPhone}'));
                                        },
                                        text: item.announcement?.contactPhone
                                                .toString() ??
                                            '',
                                        // MyFunctions.phoneFormat(
                                        //     item.announcement?.contactPhone ??
                                        //         ''),
                                        icon: AppIcons.tablerPhone,
                                      ),
                                    ),
                                  if (item.announcement?.description != '')
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: DeaelerInfoWidget(
                                          icon: AppIcons.tablerInfo,
                                          text:
                                              item.announcement?.description ??
                                                  ''),
                                    ),
                                ],
                              )),
                          if (state.userAds.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  child: Text(
                                    LocaleKeys.user_ads.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontSize: 16),
                                  ),
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.userAds.length,
                                  itemBuilder: (context, index) {
                                    final item = state.userAds[index];
                                    return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12),
                                        child: InfoResultContainer(
                                          sellType: item.isRentWithPurchase
                                              ? LocaleKeys.rent_to_buy.tr()
                                              : LocaleKeys.car_sale.tr(),
                                          currency: item.currency,
                                          discount: item.discount ?? 0.0,
                                          callFrom: item.contactAvailableFrom,
                                          callTo: item.contactAvailableTo,
                                          gallery: item.gallery,
                                          carModelName: item.model,
                                          carYear: item.year,
                                          contactPhone: item.user.phoneNumber,
                                          description: item.description,
                                          districtTitle: item.region.title,
                                          isNew: item.isNew,
                                          isWishlisted: item.isWishlisted,
                                          price: item.price,
                                          publishedAt: item.publishedAt,
                                          userFullName: item.user.fullName,
                                          userImage: item.userType != 'owner'
                                              ? item.dealer.avatar
                                              : item.user.image,
                                          userType: item.userType,
                                          hasComparison: item.isComparison,
                                          id: item.id,
                                          index: index,
                                        ));
                                  },
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      );
}
