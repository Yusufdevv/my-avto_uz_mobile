part of 'mileage_image_bloc.dart';

abstract class MileageImageEvent extends Equatable {
  const MileageImageEvent();
}

class PickMileageImage extends MileageImageEvent{
  const PickMileageImage();
  @override
  List<Object?> get props => [];

}