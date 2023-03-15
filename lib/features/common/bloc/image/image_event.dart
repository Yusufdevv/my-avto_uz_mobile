part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class GetImageEvent extends ImageEvent {
  final bool isFromGallery;

  GetImageEvent({required this.isFromGallery});
}

class PickSTSImageEvent extends ImageEvent {
  final ImageSource source;
  final int index;

  PickSTSImageEvent({required this.source, required this.index});
}

class PickDriverLicenceImageEvent extends ImageEvent {
  final ImageSource source;
  final int index;

  PickDriverLicenceImageEvent({required this.source, required this.index});
}

class DeleteImageEvent extends ImageEvent {
  final String imageUrl;

  DeleteImageEvent({required this.imageUrl});
}
