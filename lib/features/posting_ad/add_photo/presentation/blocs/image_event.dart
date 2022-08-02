part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();
}


class PickImage extends ImageEvent{
  const PickImage();
  @override
  List<Object?> get props => [];
}

class DeleteImage extends ImageEvent{
  final String imageUrl;

  const DeleteImage({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];


}
