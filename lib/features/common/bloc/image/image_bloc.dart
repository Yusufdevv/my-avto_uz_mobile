import 'dart:io';

import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'image_event.dart';

part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagePicker picker;

  ImageBloc(this.picker)
      : super(
          ImageState(
            image: File(''),
            images: const ['',''],
            secondImage: const ['',''],
          ),
        ) {
    on<GetImageEvent>((event, emit) async {
      XFile? image;
      XFile? photo;
      File? images = state.image;
      if (event.isFromGallery) {
        image = await picker.pickImage(
            source: ImageSource.gallery, imageQuality: 90);
      } else {
        photo = await picker.pickImage(
            source: ImageSource.camera, imageQuality: 90);
      }
      if (event.isFromGallery) {
        images = File(image!.path);
      } else {
        images = File(photo!.path);
      }
      emit(state.copyWith(image: images));
    });

    on<PickDriverLicenceImageEvent>((event, emit) async {
      final permission = event.source == ImageSource.camera
          ? await MyFunctions.getCameraPermission(Platform.isAndroid)
          : await MyFunctions.getPhotosPermission(Platform.isAndroid);

      if (permission.isGranted) {
        final image =
            await picker.pickImage(source: event.source, imageQuality: 90);

        if (image != null) {
          final images = [...state.secondImage];
          images[event.index] = image.path;
          emit(state.copyWith(secondImage: [...images]));
        }
      }
    });

    on<PickSTSImageEvent>((event, emit) async {
      final permission = event.source == ImageSource.camera
          ? await MyFunctions.getCameraPermission(Platform.isAndroid)
          : await MyFunctions.getPhotosPermission(Platform.isAndroid);

      if (permission.isGranted) {
        final image =
            await picker.pickImage(source: event.source, imageQuality: 90);
        if (image != null) {
          final images = [...state.images];
          images[event.index] = image.path;
          emit(state.copyWith(images: [...images]));
        }
      }
    });

    on<DeleteImageEvent>((event, emit) {
      final images = <String>[...state.images];
      final secondImage = <String>[...state.secondImage];
      if (images.contains(event.imageUrl)) {
        final index = images.indexOf(event.imageUrl);
        images[index] = '';
      }
      if (secondImage.contains(event.imageUrl)) {
        final index = images.indexOf(event.imageUrl);
        secondImage[index] = '';
      }

      emit(state.copyWith(images: [...images], secondImage: [...secondImage]));
    });
  }
}
