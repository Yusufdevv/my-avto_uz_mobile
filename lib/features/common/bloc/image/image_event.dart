part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class GetImageEvent extends ImageEvent {
  final bool isFromGallery;

  GetImageEvent({required this.isFromGallery});
}
