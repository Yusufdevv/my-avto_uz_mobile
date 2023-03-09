part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class GetImageEvent extends ImageEvent {
  final bool isFromGallery;

  GetImageEvent({required this.isFromGallery});
}

class PickSTSImageEvent extends ImageEvent {
  final ImageSource source;

  PickSTSImageEvent({required this.source});
}

class PickDriverLicenceImageEvent extends ImageEvent {
  final ImageSource source;

  PickDriverLicenceImageEvent({required this.source});
}

class DeleteImageEvent extends ImageEvent {
  final String imageUrl;

  DeleteImageEvent({required this.imageUrl});
}
