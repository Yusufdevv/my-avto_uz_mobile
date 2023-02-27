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
      final permission =
          await MyFunctions.getCameraPermission(Platform.isAndroid);
      if (permission.isGranted) {
        final image = await imagePicker.pickImage(
            source: ImageSource.camera, imageQuality: 90);
        if (image != null) {
          emit(state.copyWith(image: image.path));
        }
      } else {
        final how = permission.isPermanentlyDenied ? 'permanently' : '';
        emit(state.copyWith(
            toastMessage: 'You have denied taking picture $how'));
      }
    });
  }
}
