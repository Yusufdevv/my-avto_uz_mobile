import 'dart:typed_data';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/marker_generator.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/map_point_name.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/dealers/domain/entities/map_entity.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/custom_point.dart';
import 'package:auto/features/dealers/presentation/widgets/map_controller_buttons.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {required this.isNightMode,
      required this.iconPathh,
      Key? key,
      this.isFromDirectoryPage = false})
      : super(key: key);
  final bool isFromDirectoryPage;
  final String iconPathh;
  final bool isNightMode;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

// ignore: prefer_mixin
class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin {
  late YandexMapController _mapController;
  final List<MapObject<dynamic>> _mapObjects = [];

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
    return CustomScreen(
      child: Scaffold(
        body: BlocConsumer<MapOrganizationBloc, MapOrganizationState>(
          listenWhen: (state1, state2) {
            final isBuild = widget.isFromDirectoryPage
                ? state1.directoriesPoints.length !=
                    state2.directoriesPoints.length
                : state1.dealers.length != state2.dealers.length;
            return isBuild || state2.isAdDealler;
          },
          listener: (context, state) async {
            await addDealer(
              points: widget.isFromDirectoryPage
                  ? state.directoriesPoints
                  : state.dealers,
              buildContext: context,
              accuracy: accuracy,
              isDirectoryPage: widget.isFromDirectoryPage,
            );
            context
                .read<MapOrganizationBloc>()
                .add(MapOrganizationEvent.switchIsAdDealler(value: false));
          },
          builder: (context, mapOrganizationState) => Stack(
            children: [
              Positioned.fill(
                top: -24,
                child: YandexMap(
                  nightModeEnabled: widget.isNightMode,
                  rotateGesturesEnabled: false,
                  onCameraPositionChanged:
                      (cameraPosition, updateReason, isStopped) async {
                    if (isStopped) {
                      zoomLevel = cameraPosition.zoom;
                      context.read<MapOrganizationBloc>().add(
                          MapOrganizationEvent.changeLatLong(
                              lat: cameraPosition.target.latitude,
                              long: cameraPosition.target.longitude,
                              radius: MyFunctions.getRadiusFromZoom(
                                      cameraPosition.zoom)
                                  .floor()));
                      await StorageRepository.putDouble(
                          StorageKeys.LATITUDE, cameraPosition.target.latitude);
                      await StorageRepository.putDouble(StorageKeys.LONGITUDE,
                          cameraPosition.target.longitude);
                    }
                    // setState(() {});
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
                        latitude: StorageRepository.getDouble(
                            StorageKeys.LATITUDE,
                            defValue: 41.310990),
                        longitude: StorageRepository.getDouble(
                            StorageKeys.LONGITUDE,
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
                              context.read<ShowPopUpBloc>().add(
                                    ShowPopUp(
                                      message: message,
                                      status: PopStatus.error,
                                    ),
                                  );

                              context.read<MapOrganizationBloc>()
                                ..add(MapOrganizationEvent.getAddressOfDealler(
                                    lat: position.latitude,
                                    long: position.longitude,
                                    currentDealer: null))
                                ..add(
                                  MapOrganizationEvent.changeLatLong(
                                    lat: position.latitude,
                                    long: position.longitude,
                                    radius: MyFunctions.getRadiusFromZoom(
                                            camera.zoom)
                                        .floor(),
                                  ),
                                );
                              widget.isFromDirectoryPage
                                  ? context.read<MapOrganizationBloc>().add(
                                      MapOrganizationEvent.getDirectoriesPoints(
                                          latitude: position.latitude,
                                          longitude: position.longitude,
                                          radius: MyFunctions.getRadiusFromZoom(
                                              camera.zoom)))
                                  : context.read<MapOrganizationBloc>().add(
                                      MapOrganizationEvent.getDealers(
                                          onSuccess: (v) {},
                                          latitude: position.latitude,
                                          longitude: position.longitude,
                                          radius: MyFunctions.getRadiusFromZoom(
                                              camera.zoom)));
                            },
                            onSuccess: (position) async {
                              myPoint = Point(
                                  latitude: position.latitude,
                                  longitude: position.longitude);
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
                              context.read<MapOrganizationBloc>()
                                ..add(MapOrganizationEvent.getAddressOfDealler(
                                    lat: position.latitude,
                                    long: position.longitude,
                                    currentDealer: null))
                                ..add(
                                  MapOrganizationEvent.changeLatLong(
                                    lat: position.latitude,
                                    long: position.longitude,
                                    radius: MyFunctions.getRadiusFromZoom(
                                            camera.zoom)
                                        .floor(),
                                  ),
                                );
                              widget.isFromDirectoryPage
                                  ? context.read<MapOrganizationBloc>().add(
                                      MapOrganizationEvent.getDirectoriesPoints(
                                          latitude: position.latitude,
                                          longitude: position.longitude,
                                          radius: MyFunctions.getRadiusFromZoom(
                                              camera.zoom)))
                                  : context.read<MapOrganizationBloc>().add(
                                      MapOrganizationEvent.getDealers(
                                          onSuccess: (v) {},
                                          latitude: position.latitude,
                                          longitude: position.longitude,
                                          radius: MyFunctions.getRadiusFromZoom(
                                              camera.zoom)));

                              ////////////////////////////////////////////
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));
                              context.read<MapOrganizationBloc>().add(
                                    MapOrganizationEvent.getCurrentLocation(
                                      onSuccess: (position) async {
                                        myPoint = Point(
                                            latitude: position.latitude,
                                            longitude: position.longitude);

                                        accuracy = position.accuracy;
                                        await _mapController.moveCamera(
                                          CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                              target: Point(
                                                  latitude: position.latitude,
                                                  longitude:
                                                      position.longitude),
                                              zoom: 15,
                                            ),
                                          ),
                                          animation: const MapAnimation(
                                              duration: 0.15,
                                              type: MapAnimationType.smooth),
                                        );
                                        zoomLevel = 15;
                                        context.read<MapOrganizationBloc>().add(
                                            MapOrganizationEvent
                                                .getAddressOfDealler(
                                                    lat: position.latitude,
                                                    long: position.longitude,
                                                    currentDealer: null));
                                      },
                                      onError: (message) {
                                        context.read<ShowPopUpBloc>().add(
                                              ShowPopUp(
                                                message: message,
                                                status: PopStatus.error,
                                              ),
                                            );
                                      },
                                    ),
                                  );
                              zoomLevel = 15;
                            },
                          ),
                        );
                  },
                ),
              ),

              /// CONTROLLER BUTTONS and mappointname
              Positioned(
                right: 0,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: MapControllerButtons(
                        onCurrentLocationTap: () async {
                          context.read<MapOrganizationBloc>().add(
                                MapOrganizationEvent.getCurrentLocation(
                                  onSuccess: (position) async {
                                    myPoint = Point(
                                        latitude: position.latitude,
                                        longitude: position.longitude);

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
                                    context.read<MapOrganizationBloc>().add(
                                          MapOrganizationEvent
                                              .getAddressOfDealler(
                                            lat: position.latitude,
                                            long: position.longitude,
                                            currentDealer: null,
                                          ),
                                        );
                                  },
                                  onError: (message) {
                                    context.read<ShowPopUpBloc>().add(
                                          ShowPopUp(
                                            message: message,
                                            status: PopStatus.error,
                                          ),
                                        );
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
                    Container(
                      width: MediaQuery.of(context).size.width - 32,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToNero,
                        // color:Colors.teal,
                        border: Border.all(color: borderCircular, width: 1),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> mapBitmapsToMarkers({
    required List<Uint8List?> bitmaps,
    required List<MapEntity> points,
    required BuildContext contextt,
    required double accuracy,
    required bool isDirectoryPage,
  }) async {
    final placeMarks = <PlacemarkMapObject>[];
    bitmaps.asMap().forEach((key, value) {
      placeMarks.add(
        PlacemarkMapObject(
          opacity: 1,
          mapId: MapObjectId(points[key].id.toString()),
          point: Point(
              latitude: points[key].latitude, longitude: points[key].longitude),
          onTap: (object, point) {
            context.read<MapOrganizationBloc>().add(
                  MapOrganizationEvent.getAddressOfDealler(
                    lat: point.latitude,
                    long: point.longitude,
                    currentDealer: points[key],
                  ),
                );

            _mapController.moveCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: Point(
                    latitude: point.latitude,
                    longitude: point.longitude,
                  ),
                  zoom: zoomLevel,
                ),
              ),
            );
          },
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              scale:
                  isDirectoryPage && points[key].iconPath != AppIcons.currentLoc
                      ? 2
                      : 0.9,
              image: value != null
                  ? BitmapDescriptor.fromBytes(value)
                  : BitmapDescriptor.fromAssetImage(points[key].iconPath),
              rotationType: RotationType.noRotation,
            ),
          ),
        ),
      );
    });
    var clusterItem = ClusterizedPlacemarkCollection(
      zIndex: 1,
      mapId: MyFunctions.clusterId,
      placemarks: placeMarks,
      radius: 25,
      minZoom: 30,
      onClusterTap: (collection, cluster) {
        _mapController.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(
                  latitude: collection.placemarks.first.point.latitude,
                  longitude: collection.placemarks.first.point.latitude),
              zoom: 15,
            ),
          ),
        );
      },
      onTap: (collection, point) {},
      onClusterAdded: (collection, cluster) async => cluster.copyWith(
        /// marklar bir joyga kelganda chiqadigan
        appearance: cluster.appearance.copyWith(
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromBytes(
                await MyFunctions.getBytesFromCanvas(
                  image: widget.iconPathh,
                  width: 200,
                  height: 410,
                  placeCount: cluster.placemarks.length,
                  context: context,
                  shouldAddText: true,
                ),
              ),
              scale: widget.isFromDirectoryPage ? 2 : .6,
            ),
          ),
        ),
      ),
    );

    _mapObjects.addAll([clusterItem]);
    setState(() {});
  }

  Future<void> addDealer({
    required List<MapEntity> points,
    required BuildContext buildContext,
    required double accuracy,
    required bool isDirectoryPage,
  }) async {
    _mapObjects.clear();
    MarkerGenerator(
        points
            .map((l) => CustomPoint(
                  iconPath: l.iconPath,
                  url: l.avatar,
                ))
            .toList(), (lis) {
      setState(() {
        mapBitmapsToMarkers(
          bitmaps: lis,
          points: points,
          isDirectoryPage: isDirectoryPage,
          contextt: buildContext,
          accuracy: accuracy,
        );
      });
    }).generate(buildContext);
  }

  @override
  bool get wantKeepAlive => true;
}
