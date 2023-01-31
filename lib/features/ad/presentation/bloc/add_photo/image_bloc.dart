import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final imagePicker = ImagePicker();

  ImageBloc()
      : super(ImageState(
          panaramaImages: const [],
          images: const [],
          image: File(''),
        )) {
    on<PickPanaramaImageEvent>((event, emit) async {
      Permission permissionType;
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt <= 32) {
          permissionType = Permission.storage;
        } else {
          permissionType = Permission.photos;
        }

        var permission = await permissionType.status;
        if (!permission.isGranted) {
          permission = await permissionType.request();
        }
        if (!permission.isGranted) return;
      }

      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      print(
          '=> => => => picked panarama image path    ${image?.path}    <= <= <= <=');
      if (image != null) {
        emit(state
            .copyWith(panaramaImages: [image.path, ...state.panaramaImages]));
      }
    });
    on<PickImage>((event, emit) async {
      var permission = await Permission.camera.status;
      print(
          '=> => => =>    CAMERA PERMISSION STATUS NAME: ${permission.name}     <= <= <= <=');
      if (!permission.isGranted) {
        permission = await Permission.camera.request();
        print(
            '=> => => =>     camera request status name: ${permission.name}    <= <= <= <=');
      }
      if (permission.isGranted) {
        final image = await imagePicker.pickImage(source: event.source);
        if (image != null) {
          emit(state.copyWith(images: [image.path, ...state.images]));
        }
      }
    });
    on<DeleteImage>((event, emit) {
      final image = <String>[...state.images];
      if (image.contains(event.imageUrl)) {
        image.remove(event.imageUrl);
      }
      emit(state.copyWith(images: image));
      emit(state.copyWith(image: File('')));
    });
    on<GetImage>((event, emit) async {
      final image = await imagePicker.pickImage(source: event.source);
      if (image != null) {
        emit(state.copyWith(image: File(image.path)));
      }
    });
  }
}
