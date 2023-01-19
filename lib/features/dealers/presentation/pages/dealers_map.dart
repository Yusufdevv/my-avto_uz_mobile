import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/dealers/domain/usecases/get_directories_map_point_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/get_map_dealers.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/map_controller_buttons.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, this.isDirectoryPage = false}) : super(key: key);
  final bool isDirectoryPage;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

// ignore: prefer_mixin
class _MapScreenState extends State<MapScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late YandexMapController _mapController;
  final List<MapObject<dynamic>> _mapObjects = [];
  late MapOrganizationBloc mapOrganizationBloc;

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
    mapOrganizationBloc = MapOrganizationBloc(
        GetMapDealersUseCase(), GetDirectoriesMapPointUseCase());
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
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: mapOrganizationBloc,
          ),
        ],
        child: CustomScreen(
          child: Scaffold(
            body: BlocConsumer<MapOrganizationBloc, MapOrganizationState>(
              listenWhen: (state1, state2) {
                final isBuild = widget.isDirectoryPage
                    ? state1.directoriesPoints.length !=
                        state2.directoriesPoints.length
                    : state1.dealers.length != state2.dealers.length;
                return isBuild;
              },
              listener: (context, state) {
                print(' map delaers ${state.dealers}');
                setState(() {
                  MyFunctions.addDealer(
                    points: widget.isDirectoryPage
                        ? state.directoriesPoints
                        : state.dealers,
                    context: context,
                    mapObjects: _mapObjects,
                    controller: _mapController,
                    point: myPoint,
                    accuracy: accuracy,
                    isDirectoryPage: widget.isDirectoryPage,
                  );
                });
              },
              builder: (context, mapOrganizationState) => Stack(
                children: [
                  Positioned.fill(
                    top: -24,
                    child: YandexMap(
                      rotateGesturesEnabled: false,
                      onCameraPositionChanged:
                          (cameraPosition, updateReason, isStopped) async {
                        if (isStopped) {
                          zoomLevel = cameraPosition.zoom;
                          mapOrganizationBloc.add(
                              MapOrganizationEvent.changeLatLong(
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
                        context.read<MapOrganizationBloc>().add(
                              MapOrganizationEvent.getCurrentLocation(
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
                                      ),
                                    ),
                                    animation: const MapAnimation(
                                        duration: 0.15,
                                        type: MapAnimationType.smooth),
                                  );
                                  print(
                                      'lat:${position.latitude} and long${position.longitude}');
                                  mapOrganizationBloc.add(
                                    MapOrganizationEvent.changeLatLong(
                                      lat: position.latitude,
                                      long: position.longitude,
                                      radius: MyFunctions.getRadiusFromZoom(
                                              camera.zoom)
                                          .floor(),
                                    ),
                                  );
                                  widget.isDirectoryPage
                                      ? mapOrganizationBloc.add(
                                          MapOrganizationEvent.getDirectoriesPoints(
                                              latitude: position.latitude,
                                              longitude: position.longitude,
                                              radius:
                                                  MyFunctions.getRadiusFromZoom(
                                                      camera.zoom)))
                                      : mapOrganizationBloc.add(
                                          MapOrganizationEvent.getDealers(
                                              latitude: position.latitude,
                                              longitude: position.longitude,
                                              radius:
                                                  MyFunctions.getRadiusFromZoom(
                                                      camera.zoom)));
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
