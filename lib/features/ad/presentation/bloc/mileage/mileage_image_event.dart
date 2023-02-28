part of 'mileage_image_bloc.dart';

abstract class MileageImageEvent {}

class MakeToastMessageNullEvent extends MileageImageEvent {}

class PickMileageImage extends MileageImageEvent {
  final ImageSource source;

   PickMileageImage({required this.source});
}

class DeleteImage extends MileageImageEvent {

   DeleteImage();
}
