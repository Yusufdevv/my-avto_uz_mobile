

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/presentation/bloc/map/map_bloc.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/buttons.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/submit_sheet.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreenPostingAd extends StatefulWidget {
  final double initialLat;
  final double initialLong;

  const MapScreenPostingAd(
      {required this.initialLat, required this.initialLong, Key? key})
      : super(key: key);

  @override
  State<MapScreenPostingAd> createState() => _MapScreenPostingAdState();
}

// ignore: prefer_mixin
class _MapScreenPostingAdState extends State<MapScreenPostingAd>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late YandexMapController _mapController;
  final List<MapObject<dynamic>> _mapObjects = [];
  late MapBloc mapBloc;

  double zoomLevel = 15;
  int currentRadius = 100000;
  double maxZoomLevel = 0;
  double minZoomLevel = 0;
  double accuracy = 0;
  late Point myPointt;

  @override
  void initState() {
    mapBloc = MapBloc(
      long: widget.initialLong,
      lat: widget.initialLat,
    );
    myPointt =
        Point(latitude: widget.initialLat, longitude: widget.initialLong);

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: mapBloc,
        child: CustomScreen(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: white,
                centerTitle: true,
                leading: WScaleAnimation(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(AppIcons.cancel, color: grey),
                  ),
                ),
                title: Text(
                  LocaleKeys.map.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                )),
            body: BlocBuilder<MapBloc, MapState>(
              builder: (context, statee) => Stack(
                children: [
                  Positioned.fill(
                    top: -24,
                    child: YandexMap(
                      rotateGesturesEnabled: false,
                      onCameraPositionChanged:
                          (cameraPosition, updateReason, isStopped) async {
                        zoomLevel = cameraPosition.zoom;
                        setState(() {});
                      },
                      onMapTap: (point) async {
                        myPointt = Point(
                            latitude: point.latitude,
                            longitude: point.longitude);
                        final myPlaceMark =
                            await MyFunctions.getMyPoint(myPointt, context);
                        setState(() {
                          _mapObjects.add(myPlaceMark);
                        });

                        await _mapController.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              zoom: zoomLevel,
                              target: myPointt,
                            ),
                          ),
                          animation: const MapAnimation(
                              duration: 0.15, type: MapAnimationType.smooth),
                        );
                        mapBloc.add(
                          MapChangeLatLongEvent(
                            lat: point.latitude,
                            long: point.longitude,
                            radius: MyFunctions.getRadiusFromZoom(zoomLevel)
                                .floor(),
                          ),
                        );

                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.unfocus();
                      },
                      mapObjects: _mapObjects,
                      onMapCreated: (controller) async {
                        mapBloc.add(
                          MapChangeLatLongEvent(
                              lat: widget.initialLat == 0
                                  ? StorageRepository.getDouble('lat',
                                      defValue: 41.310990)
                                  : widget.initialLat,
                              long: widget.initialLong == 0
                                  ? StorageRepository.getDouble('long',
                                      defValue: 69.281997)
                                  : widget.initialLong,
                              radius: MyFunctions.getRadiusFromZoom(zoomLevel)
                                  .floor()),
                        );
                        final lat = widget.initialLat == 0
                            ? StorageRepository.getDouble('lat',
                                defValue: 41.310990)
                            : widget.initialLat;
                        final long = widget.initialLong == 0
                            ? StorageRepository.getDouble('long',
                                defValue: 69.281997)
                            : widget.initialLong;

                        mapBloc.add(GetPointName(long: long, lat: lat));
                        _mapController = controller;
                        maxZoomLevel = await controller.getMaxZoom();
                        minZoomLevel = await controller.getMinZoom();
                        final camera = await _mapController.getCameraPosition();
                        myPointt = Point(
                          latitude: lat,
                          longitude: long,
                        );
                        final myPlaceMark =
                            await MyFunctions.getMyPoint(myPointt, context);
                        setState(() {
                          _mapObjects.add(myPlaceMark);
                        });
                        await _mapController.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              zoom: zoomLevel,
                              target: Point(
                                latitude: lat,
                                longitude: long,
                              ),
                            ),
                          ),
                          animation: const MapAnimation(
                              duration: 0.15, type: MapAnimationType.smooth),
                        );
                        setState(() {});
                        if (41.310990 == lat) {
                          mapBloc.add(
                            MapGetCurrentLocationEvent(
                              onError: (message) {
                                context.read<ShowPopUpBloc>().add(ShowPopUp(
                                      message: message,
                                      status: PopStatus.warning,
                                    ));
                              },
                              onSuccess: (position) async {
                                myPointt = Point(
                                  latitude: position.latitude,
                                  longitude: position.longitude,
                                );
                                final myPlaceMark =
                                    await MyFunctions.getMyPoint(
                                        myPointt, context);
                                setState(() {
                                  _mapObjects.add(myPlaceMark);
                                });
                                accuracy = position.accuracy;
                                await _mapController.moveCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: Point(
                                          latitude: position.latitude,
                                          longitude: position.longitude),
                                    ),
                                  ),
                                  animation: const MapAnimation(
                                      duration: 0.15,
                                      type: MapAnimationType.smooth),
                                );
                                mapBloc.add(
                                  MapChangeLatLongEvent(
                                    lat: position.latitude,
                                    long: position.longitude,
                                    radius: MyFunctions.getRadiusFromZoom(
                                            camera.zoom)
                                        .floor(),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 198,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: PostingAdMapControllerButtons(
                        onMinusTap: () {
                          if (minZoomLevel < zoomLevel) {
                            _mapController.moveCamera(
                              CameraUpdate.zoomTo(zoomLevel - 1),
                              animation: const MapAnimation(
                                  duration: 0.2, type: MapAnimationType.smooth),
                            );
                            zoomLevel--;
                          }
                        },
                        onPlusTap: () async {
                          if (maxZoomLevel > zoomLevel) {
                            await _mapController.moveCamera(
                              CameraUpdate.zoomTo(zoomLevel + 1),
                              animation: const MapAnimation(
                                  duration: 0.2, type: MapAnimationType.smooth),
                            );
                            zoomLevel++;
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: PostingAdSubmitBox(
                      onTab: () {
                        Navigator.of(context).pop(statee.lat == 0
                            ? null
                            : [statee.lat, statee.long, zoomLevel]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
