import 'dart:io';

import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

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
      final permission =
          await MyFunctions.getPhotosPermission(Platform.isAndroid);
          print('=> => => =>     permidssion is $permission    <= <= <= <=');
      if (!permission) return;
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      print(
          '=> => => => picked panarama image path    ${image?.path}    <= <= <= <=');
      if (image != null) {
        emit(state
            .copyWith(panaramaImages: [image.path, ...state.panaramaImages]));
      }
    });
    on<PickImage>((event, emit) async {
      final permission =
          await MyFunctions.getCameraPermission(Platform.isAndroid);

      if (permission) {
        final image = await imagePicker.pickImage(source: event.source);
        if (image != null) {
          emit(state.copyWith(images: [image.path, ...state.images]));
        }
      }
    });
    on<DeleteImage>((event, emit) {
      final image = <String>[...state.images];
      final panarama = <String>[...state.panaramaImages];
      print(
          '=> => => =>     pl: ${panarama.length}  il: ${image.length}  <= <= <= <=');
      if (image.contains(event.imageUrl)) {
        image.remove(event.imageUrl);
      }
      if (panarama.contains(event.imageUrl)) {
        panarama.remove(event.imageUrl);
      }
      print(
          '=> => => =>     pl: ${panarama.length}  il: ${image.length}  <= <= <= <=');
      emit(state.copyWith(images: image, panaramaImages: panarama));
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
