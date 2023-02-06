part of 'image_bloc.dart';

abstract class ImageEvent {
  const ImageEvent();
}
class PickPanaramaImageEvent extends ImageEvent{
  
}

class PickImage extends ImageEvent {
  final ImageSource source;

  const PickImage({required this.source});
}

class DeleteImage extends ImageEvent {
  final String imageUrl;

  const DeleteImage({required this.imageUrl});
}

class GetImage extends ImageEvent {
  final ImageSource source;

  const GetImage({required this.source});
}
