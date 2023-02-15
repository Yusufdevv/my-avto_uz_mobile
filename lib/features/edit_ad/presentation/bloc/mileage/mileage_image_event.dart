part of 'mileage_image_bloc.dart';

abstract class MileageImageEvent {}
class MakeToastMessageNullEvent extends MileageImageEvent{

}
class PickMileageImage extends MileageImageEvent {
  PickMileageImage();
}
