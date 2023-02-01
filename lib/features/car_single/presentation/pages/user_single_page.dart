import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/bloc/user_single_bloc/user_single_bloc.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_single_info_part.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_sliver_delegete.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
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
      ..add(UserSingleEvent.getUserSingle(userId: widget.userId, announcementId: widget.announcementId))
      ..add(UserSingleEvent.getUserAds(userId: widget.userId))
      ;

    super.initState();
  }

  @override
  void dispose() {
    userSingleBloc.close();
    super.dispose();
  }

  late YandexMapController controller;
  double maxZoomLevel = 0;
  double minZoomLevel = 0;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: userSingleBloc,
        child: Scaffold(
          body: BlocBuilder<UserSingleBloc, UserSingleState>(
            builder: (context, state) {
              if (state.status.isSubmissionSuccess) {
                final item = state.userSingleEntity;
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: DirectorySliverDelegate(
                          gallery: item.announcement?.gallery ?? [],
                          avatarImage: item.user?.image ?? '',
                          name: item.announcement?.contactName ?? '',
                          minHeight: MediaQuery.of(context).size.height * 0.11,
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
                                  Info(
                                      text:
                                          '${LocaleKeys.every_day.tr()}, ${item.announcement?.contactAvailableFrom?.substring(0, 5)} - ${item.announcement?.contactAvailableTo?.substring(0, 5)}',
                                      icon: AppIcons.clock),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: warmerGrey,
                                    ),
                                    padding: const EdgeInsets.all(1),
                                    height: 110,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: YandexMap(
                                        rotateGesturesEnabled: false,
                                        onMapCreated: (controller) async {
                                          controller = controller;
                                          await controller.moveCamera(
                                            CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                target: Point(
                                                    latitude: item.announcement?.latitude ?? 0.0,
                                                    longitude: item.announcement?.longitude ?? 0.0),
                                              ),
                                            ),
                                            animation: const MapAnimation(
                                                duration: 0.15,
                                                type: MapAnimationType.smooth),
                                          );
                                        },
                                        mapObjects: [
                                          PlacemarkMapObject(
                                            icon: PlacemarkIcon.single(
                                              PlacemarkIconStyle(
                                                scale: 0.6,
                                                image: BitmapDescriptor
                                                    .fromAssetImage(
                                                        AppIcons.currentLoc),
                                              ),
                                            ),
                                            mapId: MapObjectId(
                                                item.announcement?.latitude.toString() ?? ''),
                                            point: Point(
                                                latitude: item.announcement?.latitude ?? 0.0,
                                                longitude: item.announcement?.longitude ?? 0.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Info(
                                      text: MyFunctions.phoneFormat(
                                          item.announcement?.contactPhone ?? ''),
                                      icon: AppIcons.tablerPhone,
                                    ),
                                  ),
                                  Info(
                                      icon: AppIcons.tablerInfo,
                                      text: item.announcement?.description ?? ''),
                                ],
                              )),
                          if (state.userAds.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, bottom: 12, left: 16, right: 16),
                                  child: Text(
                                    LocaleKeys.all.tr(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: greyText),
                                  ),
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.userAds.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: InfoContainer(
                                      index: index,
                                      avatarPicture:
                                          item.user?.image ?? '',
                                      carModel:
                                          state.userAds[index].absoluteCarName,
                                      hasDiscount: false,
                                      location: state.userAds[index].region.title,
                                      owner: item.announcement?.contactName ?? '',
                                      ownerType: 'a',
                                      publishTime:
                                          MyFunctions.getAutoPublishDate(
                                              state.userAds[index].publishedAt),
                                      subtitle: state.userAds[index].description,
                                      year: state.userAds[index].year,
                                      price: state.userAds[index].price.toString(),
                                      discountPrice: state.userAds[index].discount.toString(),
                                      sellType: LocaleKeys.car_sale.tr(),
                                      hasStatusInfo: true,
                                      hasCallCard: true,
                                      gallery: state.userAds[index].gallery,
                                      currency: state.userAds[index].currency,
                                      initialLike: false,
                                      onTapFavorites: () {},
                                      onTapComparsion: () {},
                                      initialComparsions: false,
                                      id: state.userAds[index].id,
                                    ),
                                  ),
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
