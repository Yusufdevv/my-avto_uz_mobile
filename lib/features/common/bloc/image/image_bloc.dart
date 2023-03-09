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
            images: const [],
            secondImage: '',
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
          emit(state.copyWith(secondImage: image.path));
        }
      }
      // else {
      //   final what = event.source == ImageSource.camera
      //       ? 'taking picture'
      //       : 'picking image';
      //   final how = permission.isPermanentlyDenied ? 'permanently' : '';
      //   emit(state.copyWith(toastMessage: 'You have denied $what $how'));
      // }
    });

    on<PickSTSImageEvent>((event, emit) async {
      final permission = event.source == ImageSource.camera
          ? await MyFunctions.getCameraPermission(Platform.isAndroid)
          : await MyFunctions.getPhotosPermission(Platform.isAndroid);

      if (permission.isGranted) {
        final image =
            await picker.pickImage(source: event.source, imageQuality: 90);
        if (image != null) {
          emit(state.copyWith(images: [image.path, ...state.images]));
        }
      }
      // else {
      //   final what = event.source == ImageSource.camera
      //       ? 'taking picture'
      //       : 'picking image';
      //   final how = permission.isPermanentlyDenied ? 'permanently' : '';
      //   emit(state.copyWith(toastMessage: 'You have denied $what $how'));
      // }
    });

    on<DeleteImageEvent>((event, emit) {
      final images = <String>[...state.images];
      var image = state.secondImage;
      if (images.contains(event.imageUrl)) {
        images.remove(event.imageUrl);
      }
      if (image == event.imageUrl) {
        image = '';
      }
      emit(state.copyWith(images: images, secondImage: image));
    });
  }
}
