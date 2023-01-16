import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'mileage_image_event.dart';
part 'mileage_image_state.dart';

class MileageImageBloc extends Bloc<MileageImageEvent, MileageImageState> {
  final imagePicker = ImagePicker();
  MileageImageBloc() : super(const MileageImageState(image: '')) {
    on<PickMileageImage>((event, emit) async {
      final image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        emit(state.copyWith(image: image.path));
      }
    });
  }
}
