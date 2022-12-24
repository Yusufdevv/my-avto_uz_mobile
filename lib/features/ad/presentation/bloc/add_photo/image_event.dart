part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();
}

class PickImage extends ImageEvent {
  final ImageSource source;

  const PickImage({required this.source});

  @override
  List<Object?> get props => [source];
}

class DeleteImage extends ImageEvent {
  final String imageUrl;

  const DeleteImage({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}

class GetImage extends ImageEvent {
  final ImageSource source;

  const GetImage({required this.source});

  @override
  List<Object?> get props => [source];
}
