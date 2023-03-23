import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/point_name_shimmer.dart';
import 'package:auto/features/car_single/presentation/bloc/inspection_place_address_bloc/inspection_place_address_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class InspectionPlaceSingleScreen extends StatefulWidget {
  const InspectionPlaceSingleScreen(
      {required this.long, required this.lat, Key? key})
      : super(key: key);
  final double lat;
  final double long;

  @override
  State<InspectionPlaceSingleScreen> createState() =>
      _InspectionPlaceSingleScreenState();
}

class _InspectionPlaceSingleScreenState
    extends State<InspectionPlaceSingleScreen> {
  late YandexMapController _mapController;
  double zoomLevel = 15;
  double maxZoomLevel = 0;
  double minZoomLevel = 0;
  late InspectionPlaceAddressBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = InspectionPlaceAddressBloc()
      ..add(GetAddressEvent(lat: widget.lat, long: widget.long));
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          appBar: WAppBar(
            title: LocaleKeys.map.tr(),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: YandexMap(
                  rotateGesturesEnabled: false,
                  onMapCreated: (controller) async {
                    _mapController = controller;
                    maxZoomLevel = await controller.getMaxZoom();
                    minZoomLevel = await controller.getMinZoom();
                    await _mapController.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: Point(
                              latitude: widget.lat, longitude: widget.long),
                        ),
                      ),
                      animation: const MapAnimation(
                          duration: 0.15, type: MapAnimationType.smooth),
                    );
                  },
                  mapObjects: [
                    PlacemarkMapObject(
                      onTap: (mapObject, point) {
                        // MyFunctions.openMapsSheet(context, latitude, longitude, dealerName);
                      },
                      icon: PlacemarkIcon.single(
                        PlacemarkIconStyle(
                          scale: 0.6,
                          image: BitmapDescriptor.fromAssetImage(
                              AppIcons.currentLoc),
                        ),
                      ),
                      mapId: const MapObjectId('99'),
                      point:
                          Point(latitude: widget.lat, longitude: widget.long),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      WButton(
                        onTap: () async {
                          if (maxZoomLevel > zoomLevel) {
                            await _mapController.moveCamera(
                              CameraUpdate.zoomTo(zoomLevel + 1),
                              animation: const MapAnimation(
                                  duration: 0.2, type: MapAnimationType.smooth),
                            );
                            zoomLevel++;
                          }
                        },
                        height: 36,
                        width: 36,
                        color: white,
                        borderRadius: 8,
                        border: Border.all(color: dividerColor),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 16),
                        child: SvgPicture.asset(AppIcons.plus, color: greyText),
                      ),
                      const SizedBox(height: 16),
                      WButton(
                        onTap: () {
                          if (minZoomLevel < zoomLevel) {
                            _mapController.moveCamera(
                              CameraUpdate.zoomTo(zoomLevel - 1),
                              animation: const MapAnimation(
                                  duration: 0.2, type: MapAnimationType.smooth),
                            );
                            zoomLevel--;
                          }
                        },
                        height: 36,
                        width: 36,
                        color: white,
                        borderRadius: 8,
                        border: Border.all(color: dividerColor),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 16),
                        child:
                            SvgPicture.asset(AppIcons.minus, color: greyText),
                      ),
                      const SizedBox(height: 36),
                      Container(
                        padding: const EdgeInsets.all(16).copyWith(
                            bottom: 16 + MediaQuery.of(context).padding.bottom),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, -8),
                                blurRadius: 24,
                                color: dark.withOpacity(0.05),
                              ),
                              BoxShadow(
                                offset: const Offset(0, 1),
                                color: dark.withOpacity(0.08),
                              )
                            ]),
                        child: Column(
                          children: [
                            BlocBuilder<InspectionPlaceAddressBloc,
                                InspectionPlaceAddressState>(
                              builder: (context, state) => Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(AppIcons.foldedMap,
                                      color: greyText),
                                  const SizedBox(width: 8),
                                  if (state.address.isEmpty ||
                                      state.status.isSubmissionInProgress) ...{
                                    const PointNameShimmer()
                                  } else ...{
                                    Expanded(
                                      child: Text(state.address,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                    ),
                                  }
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            WButton(
                                text: LocaleKeys.confirm.tr(),
                                color: orange,
                                onTap: () {
                                  Navigator.pop(context);
                                })
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
}
