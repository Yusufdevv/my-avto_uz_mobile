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
  const MapScreenPostingAd({Key? key}) : super(key: key);

  @override
  State<MapScreenPostingAd> createState() => _MapScreenPostingAdState();
}

// ignore: prefer_mixin
class _MapScreenPostingAdState extends State<MapScreenPostingAd>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late YandexMapController _mapController;
  final List<MapObject<dynamic>> _mapObjects = [];
  late MapBloc mapBloc;

  double latitude = 0;
  double longitude = 0;
  double zoomLevel = 15;
  int currentRadius = 100000;
  double maxZoomLevel = 0;
  double minZoomLevel = 0;
  double accuracy = 0;
  late Point myPoint;

  @override
  void initState() {
    mapBloc = MapBloc();
    myPoint = const Point(latitude: 0, longitude: 0);
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
              builder: (context, state) => Stack(
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
                        myPoint = Point(
                            latitude: point.latitude,
                            longitude: point.longitude);
                        final myPlaceMark =
                            await MyFunctions.getMyPoint(myPoint, context);
                        setState(() {
                          _mapObjects.add(myPlaceMark);
                        });

                        await _mapController.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              zoom: zoomLevel,
                              target: myPoint,
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
                        final lat = StorageRepository.getDouble('lat',
                            defValue: 41.310990);
                        final long = StorageRepository.getDouble('long',
                            defValue: 69.281997);
                        mapBloc.add(GetPointName(long: long, lat: lat));
                        _mapController = controller;
                        maxZoomLevel = await controller.getMaxZoom();
                        minZoomLevel = await controller.getMinZoom();
                        final camera = await _mapController.getCameraPosition();
                        print(' MOVING CAMERA POSITION ');
                        myPoint = Point(
                          latitude: lat,
                          longitude: long,
                        );
                        final myPlaceMark =
                            await MyFunctions.getMyPoint(myPoint, context);
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
                        print(' CAMERA MOVED TO POSITION');
                        mapBloc.add(
                          MapGetCurrentLocationEvent(
                            onError: (message) {
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message: message,
                                    status: PopStatus.warning,
                                  ));
                            },
                            onSuccess: (position) async {
                              myPoint = Point(
                                latitude: position.latitude,
                                longitude: position.longitude,
                              );
                              final myPlaceMark = await MyFunctions.getMyPoint(
                                  myPoint, context);
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
                                  radius:
                                      MyFunctions.getRadiusFromZoom(camera.zoom)
                                          .floor(),
                                ),
                              );
                            },
                          ),
                        );
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
                        if (state.lat == 0) return;
                        Navigator.of(context)
                            .pop([state.lat, state.long, zoomLevel]);
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
