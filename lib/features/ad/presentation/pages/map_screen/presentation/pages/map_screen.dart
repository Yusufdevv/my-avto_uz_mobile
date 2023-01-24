import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/presentation/bloc/map/map_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/map_controller_buttons.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      value:  mapBloc,
        child: CustomScreen(
          child: Scaffold(
            body: BlocBuilder<MapBloc, MapState>(
              builder: (context, mapOrganizationState) => Stack(
                children: [
                  Positioned.fill(
                    top: -24,
                    child: YandexMap(
                      rotateGesturesEnabled: false,
                      onCameraPositionChanged:
                          (cameraPosition, updateReason, isStopped) async {
                        print(
                            '=> => => =>     on camera position changed  is stopped $isStopped  <= <= <= <=');

                        print(
                            '=> => => =>   cameraPosition  tilt: ${cameraPosition.tilt}    <= <= <= <=');

                        print(
                            '=> => => =>   cameraPosition  azimuth: ${cameraPosition.azimuth}    <= <= <= <=');

                        print(
                            '=> => => =>   cameraPosition target lat: ${cameraPosition.target.latitude}    <= <= <= <=');

                        print(
                            '=> => => =>   cameraPosition target long: ${cameraPosition.target.longitude}    <= <= <= <=');

                        print(
                            '=> => => =>   cameraPosition zoom: ${cameraPosition.zoom}    <= <= <= <=');
                        print(
                            '=> => => =>   \n  UPDATE REASON \n    <= <= <= <=');
                        print(
                            '=> => => =>     updateREason index: ${updateReason.index}    <= <= <= <=');

                        print(
                            '=> => => =>   update reason name : ${updateReason.name}    <= <= <= <=');

                        if (isStopped) {
                          zoomLevel = cameraPosition.zoom;
                          mapBloc.add(MapChangeLatLongEvent(
                              lat: cameraPosition.target.latitude,
                              long: cameraPosition.target.longitude,
                              radius: MyFunctions.getRadiusFromZoom(
                                      cameraPosition.zoom)
                                  .floor()));
                          await StorageRepository.putDouble(
                              'lat', cameraPosition.target.latitude);
                          await StorageRepository.putDouble(
                              'long', cameraPosition.target.longitude);
                        }
                      },
                      onMapTap: (point) {
                        print(
                            '=> => => =>     ON MAP TAP lat:  ${point.latitude} / long:  ${point.longitude} <= <= <= <=');
                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.unfocus();
                      },
                      mapObjects: _mapObjects,
                      onMapCreated: (controller) async {
                        _mapController = controller;
                        maxZoomLevel = await controller.getMaxZoom();
                        minZoomLevel = await controller.getMinZoom();
                        final camera = await _mapController.getCameraPosition();
                        final position = Point(
                            latitude: StorageRepository.getDouble('lat',
                                defValue: 41.310990),
                            longitude: StorageRepository.getDouble('long',
                                defValue: 69.281997));
                        await _mapController.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: Point(
                                  latitude: position.latitude,
                                  longitude: position.longitude),
                            ),
                          ),
                          animation: const MapAnimation(
                              duration: 0.15, type: MapAnimationType.smooth),
                        );
                        mapBloc.add(
                          MapGetCurrentLocationEvent(
                            onError: (message) {
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message: message,
                                    isSucces: false,
                                  ));
                            },
                            onSuccess: (position) async {
                              myPoint = Point(
                                  latitude: position.latitude,
                                  longitude: position.longitude);
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
                    bottom: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: MapControllerButtons(
                        onCurrentLocationTap: () async {
                          context.read<MapOrganizationBloc>().add(
                                MapOrganizationEvent.getCurrentLocation(
                                  onSuccess: (position) async {
                                    myPoint = Point(
                                        latitude: position.latitude,
                                        longitude: position.longitude);
                                    final myPlaceMark =
                                        await MyFunctions.getMyPoint(
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
                                          zoom: 15,
                                        ),
                                      ),
                                      animation: const MapAnimation(
                                          duration: 0.15,
                                          type: MapAnimationType.smooth),
                                    );
                                    zoomLevel = 15;
                                  },
                                  onError: (message) {
                                    context.read<ShowPopUpBloc>().add(ShowPopUp(
                                        message: message, isSucces: false));
                                  },
                                ),
                              );
                          zoomLevel = 15;
                        },
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
                ],
              ),
            ),
          ),
        ),
      );
}
