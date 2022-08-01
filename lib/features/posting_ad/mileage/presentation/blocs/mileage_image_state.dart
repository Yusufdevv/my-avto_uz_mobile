part of 'mileage_image_bloc.dart';

 class MileageImageState extends Equatable {
   final String image;

  const MileageImageState({required this.image});

  MileageImageState copyWith ({
   String? image
 }) => MileageImageState(image: image?? this.image);

  @override
  List<Object?> get props => [image];
}
