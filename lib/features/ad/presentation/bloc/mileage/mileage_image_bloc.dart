import 'dart:developer';
import 'dart:io';

import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'mileage_image_event.dart';

part 'mileage_image_state.dart';

class MileageImageBloc extends Bloc<MileageImageEvent, MileageImageState> {
  final imagePicker = ImagePicker();

  MileageImageBloc(String? mileageImage)
      : super(MileageImageState(image: mileageImage)) {
    on<MakeToastMessageNullEvent>(
        (event, emit) => emit(state.copyWith(toastMessage: '')));

    on<PickMileageImage>((event, emit) async {
      log(':::::::::: Pick milage image triggered by : ${event.source.name}  ::::::::::');
      final permission = event.source == ImageSource.camera
          ? await MyFunctions.getCameraPermission(Platform.isAndroid)
          : await MyFunctions.getPhotosPermission(Platform.isAndroid);
      if (permission.isGranted) {
        final image =
            await imagePicker.pickImage(source: event.source, imageQuality: 90);

        if (image != null) {
          emit(state.copyWith(image: image.path));
        }
      } else {
        final what = event.source == ImageSource.camera
            ? 'taking picture'
            : 'picking image';
        final how = permission.isPermanentlyDenied ? 'permanently' : '';
        emit(state.copyWith(toastMessage: 'You have denied $what $how'));
      }
    });

    on<DeleteImage>((event, emit) {
      emit(state.copyWith(image: ''));
    });
  }
}
