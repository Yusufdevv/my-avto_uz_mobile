import 'dart:typed_data';

import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/dealers/data/models/map_model.dart';
import 'package:auto/features/dealers/domain/usecases/get_directories_map_point_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/get_map_dealers.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/custom_point.dart';
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
    with AutomaticKeepAliveClientMixin {
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
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => mapOrganizationBloc,
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
              addDealer(
                points: widget.isDirectoryPage
                    ? state.directoriesPoints
                    : state.dealers,
                context: context,
                mapObjects: _mapObjects,
                point: myPoint,
                accuracy: accuracy,
                isDirectoryPage: widget.isDirectoryPage,
              );
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
                      mapOrganizationBloc.add(
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
                                await MyFunctions.getMyPoint(myPoint, context);
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
                            mapOrganizationBloc.add(
                              MapOrganizationEvent.changeLatLong(
                                lat: position.latitude,
                                long: position.longitude,
                                radius:
                                    MyFunctions.getRadiusFromZoom(camera.zoom)
                                        .floor(),
                              ),
                            );
                            widget.isDirectoryPage
                                ? mapOrganizationBloc.add(
                                    MapOrganizationEvent.getDirectoriesPoints(
                                        latitude: position.latitude,
                                        longitude: position.longitude,
                                        radius: MyFunctions.getRadiusFromZoom(
                                            camera.zoom)))
                                : mapOrganizationBloc.add(
                                    MapOrganizationEvent.getDealers(
                                        latitude: position.latitude,
                                        longitude: position.longitude,
                                        radius: MyFunctions.getRadiusFromZoom(
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
                        mapOrganizationBloc.add(
                          MapOrganizationEvent.getCurrentLocation(
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
                              context.read<ShowPopUpBloc>().add(
                                  ShowPopUp(message: message, isSucces: false));
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

  Future<void> addDealer({
    required List<MapModel> points,
    required BuildContext context,
    required List<MapObject<dynamic>> mapObjects,
    required Point point,
    required double accuracy,
    required bool isDirectoryPage,
  }) async {
    final placeMarks = <PlacemarkMapObject>[];
    for (final point in points) {
      Uint8List? uint8list;
      if (point.gallery.isNotEmpty || true) {
        uint8list = await MyFunctions.createImageFromWidget(CustomPoint(
          scale: 1.5,
          url: point.gallery.first,
        ));
      }
      placeMarks.add(PlacemarkMapObject(
        opacity: 1,
        mapId: MapObjectId(point.latitude.toString()),
        point: Point(latitude: point.latitude, longitude: point.longitude),
        onTap: (object, point) {
          _mapController.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target:
                    Point(latitude: point.latitude, longitude: point.longitude),
                zoom: 15,
              ),
            ),
          );
        },
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            scale: 0.6,
            image: uint8list != null
                ? BitmapDescriptor.fromBytes(uint8list)
                : BitmapDescriptor.fromAssetImage(
                    isDirectoryPage
                        ? AppIcons.directoryPoint
                        : AppIcons.dealersLocIcon,
                  ),
            rotationType: RotationType.noRotation,
          ),
        ),
      ));
    }

    final myPoint = await MyFunctions.getMyPoint(point, context);
    final clusterItem = ClusterizedPlacemarkCollection(
      mapId: MyFunctions.clusterId,
      placemarks: placeMarks,
      radius: 25,
      minZoom: 30,
      onClusterTap: (collection, cluster) {
        _mapController.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: Point(
                latitude: collection.placemarks.first.point.latitude,
                longitude: collection.placemarks.first.point.latitude),
            zoom: 15)));
      },
      onTap: (collection, point) {},
      onClusterAdded: (collection, cluster) async => cluster.copyWith(
        appearance: cluster.appearance.copyWith(
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromBytes(
                await MyFunctions.getBytesFromCanvas(
                    image: AppImages.audi,
                    width: 170,
                    height: 410,
                    placeCount: cluster.placemarks.length,
                    context: context,
                    shouldAddText: true),
              ),
              scale: 0.6,
            ),
          ),
        ),
      ),
    );

    mapObjects
      ..clear()
      ..addAll([clusterItem, myPoint]);
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
