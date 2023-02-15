import 'dart:typed_data';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/map_point_name.dart';
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
import 'package:formz/formz.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, this.isFromDirectoryPage = false})
      : super(key: key);
  final bool isFromDirectoryPage;

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
              final isBuild = widget.isFromDirectoryPage
                  ? state1.directoriesPoints.length !=
                      state2.directoriesPoints.length
                  : state1.dealers.length != state2.dealers.length;
              return isBuild;
            },
            listener: (context, state) {
              addDealer(
                points: widget.isFromDirectoryPage
                    ? state.directoriesPoints
                    : state.dealers,
                context: context,
                mapObjects: _mapObjects,
                point: myPoint,
                accuracy: accuracy,
                isDirectoryPage: widget.isFromDirectoryPage,
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
                            print('ON ERROR TRIGGERED IN GET CURRENT LOCATION');
                            context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message: message,
                                  status: PopStatus.error,
                                ));
                          },
                          onSuccess: (position) async {
                            print('GET CURRENT LOCATION ON SUCCESS TRIGGERED');
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
                                MapOrganizationEvent.getAddressOfDealler(
                                    lat: position.latitude,
                                    long: position.longitude,
                                    currentDealer: null));
                            print("CHANGE LANG LONG TRIGGERED");
                            mapOrganizationBloc.add(
                              MapOrganizationEvent.changeLatLong(
                                lat: position.latitude,
                                long: position.longitude,
                                radius:
                                    MyFunctions.getRadiusFromZoom(camera.zoom)
                                        .floor(),
                              ),
                            );
                            widget.isFromDirectoryPage
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

                /// CONTROLLER BUTTONS
                Positioned(
                  right: 0,
                  bottom: 196,
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
                              mapOrganizationBloc.add(
                                  MapOrganizationEvent.getAddressOfDealler(
                                      lat: position.latitude,
                                      long: position.longitude,
                                      currentDealer: null));
                            },
                            onError: (message) {
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message: message,
                                    status: PopStatus.error,
                                  ));
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
                Positioned(
                  bottom: 46,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 32,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: white,
                      border: Border.all(
                        color: borderCircular,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 10,
                          spreadRadius: 0,
                          color: black.withOpacity(.1),
                        ),
                      ],
                    ),
                    child: MapPointName(
                      isWaiting: mapOrganizationState.status !=
                          FormzStatus.submissionSuccess,
                      name: mapOrganizationState.address,
                      currentDealer: mapOrganizationState.currentDealer,
                      isFromDirectoryPage: widget.isFromDirectoryPage,
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
    for (final mapModel in points) {
      Uint8List? uint8list;
      if (mapModel.gallery.isNotEmpty) {
        uint8list = await MyFunctions.createImageFromWidget(CustomPoint(
          scale: 1.5,
          url: mapModel.gallery.first,
        ));
      }
      placeMarks.add(
        PlacemarkMapObject(
          opacity: 1,
          mapId: MapObjectId(mapModel.latitude.toString()),
          point:
              Point(latitude: mapModel.latitude, longitude: mapModel.longitude),
          onTap: (object, point) {
            mapOrganizationBloc.add(MapOrganizationEvent.getAddressOfDealler(
                lat: point.latitude,
                long: point.longitude,
                currentDealer: mapModel));
            _mapController.moveCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: Point(
                      latitude: point.latitude, longitude: point.longitude),
                  zoom: 15,
                ),
              ),
            );
          },
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              scale: isDirectoryPage ? 1 : 0.6,
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
        ),
      );
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
                    image: AppIcons.dealersLocIcon,
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
