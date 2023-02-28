import 'dart:io';

import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'image_event.dart';

part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final imagePicker = ImagePicker();

  ImageBloc({List<String> images = const [], List<String> panaramas = const []})
      : super(
          ImageState(
            panaramaImages: panaramas,
            images: images,
            image: File(''),
          ),
        ) {
    on<PickImageEmptyToastMessageEvent>(
        (event, emit) => emit(state.copyWith(toastMessage: '')));
    on<PickPanaramaImageEvent>((event, emit) async {
      final permission =
          await MyFunctions.getPhotosPermission(Platform.isAndroid);
      if (permission.isGranted) {
        final image = await imagePicker.pickImage(
            source: ImageSource.gallery, imageQuality: 90);
        if (image != null) {
          emit(state
              .copyWith(panaramaImages: [image.path, ...state.panaramaImages]));
        }
      } else {
        final how = permission.isPermanentlyDenied ? 'permanently' : '';
        emit(
            state.copyWith(toastMessage: 'You have denied picking image $how'));
      }
    });
    on<PickImage>((event, emit) async {
      final permission = event.source == ImageSource.camera
          ? await MyFunctions.getCameraPermission(Platform.isAndroid)
          : await MyFunctions.getPhotosPermission(Platform.isAndroid);

      if (permission.isGranted) {
        final image =
            await imagePicker.pickImage(source: event.source, imageQuality: 90);
        if (image != null) {
          emit(state.copyWith(images: [image.path, ...state.images]));
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
      final image = <String>[...state.images];
      final panarama = <String>[...state.panaramaImages];
      if (image.contains(event.imageUrl)) {
        image.remove(event.imageUrl);
      }
      if (panarama.contains(event.imageUrl)) {
        panarama.remove(event.imageUrl);
      }
      emit(state.copyWith(images: image, panaramaImages: panarama));
      emit(state.copyWith(image: File('')));
    });
    on<GetImage>((event, emit) async {
      final image =
          await imagePicker.pickImage(source: event.source, imageQuality: 90);
      if (image != null) {
        emit(state.copyWith(image: File(image.path)));
      }
    });
  }
}
