import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';
part 'image_state.dart';


class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final imagePicker = ImagePicker();
  ImageBloc() : super(const ImageState(images: [])) {
    on<PickImage>((event, emit) async {
      final image = await imagePicker.pickImage(source: ImageSource.camera);
      if(image!=null){
        emit(state.copyWith(images: [image.path,
          ...state.images]));
      }
    });
    on<DeleteImage>((event, emit){
      final image = <String>[...state.images];
      if(image.contains(event.imageUrl)){
        image.remove(event.imageUrl);
      }
      emit(state.copyWith(images: image));
    });
  }
}
