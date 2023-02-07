import 'dart:io';

import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'mileage_image_event.dart';
part 'mileage_image_state.dart';

class MileageImageBloc extends Bloc<MileageImageEvent, MileageImageState> {
  final imagePicker = ImagePicker();
  MileageImageBloc(String? mileageImage) : super( MileageImageState(image:mileageImage)) {
    on<PickMileageImage>((event, emit) async {
      final permission =
          await MyFunctions.getCameraPermission(Platform.isAndroid);
      if (!permission) return;
      final image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        emit(state.copyWith(image: image.path));
      }
    });
  }
}
