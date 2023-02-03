import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/presentation/bloc/map/map_bloc.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/buttons.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/submit_sheet.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/utils/my_functions.dart';
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
                  'Карта',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
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

                      },
                      onMapTap: (point) async {
                        final camera = await _mapController.getCameraPosition();

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
                              target: Point(
                                  latitude: point.latitude,
                                  longitude: point.longitude),
                            ),
                          ),
                          animation: const MapAnimation(
                              duration: 0.15, type: MapAnimationType.smooth),
                        );
                        mapBloc.add(
                          MapChangeLatLongEvent(
                            lat: point.latitude,
                            long: point.longitude,
                            radius: MyFunctions.getRadiusFromZoom(camera.zoom)
                                .floor(),
                          ),
                        );

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
                                    status: PopStatus.error,
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
                    bottom: 198,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: PostingAdMapControllerButtons(
                        onCurrentLocationTap: () async {
                          mapBloc.add(
                            MapGetCurrentLocationEvent(
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
                    bottom: 0,
                    child: PostingAdSubmitBox(
                      address: state.address,
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
