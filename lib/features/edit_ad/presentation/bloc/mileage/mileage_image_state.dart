part of 'mileage_image_bloc.dart';

class MileageImageState extends Equatable {
  final String? image;
  final String? toastMessage;

  const MileageImageState({required this.image, this.toastMessage});

  MileageImageState copyWith({String? toastMessage, String? image}) =>
      MileageImageState(
        image: image ?? this.image,
        toastMessage: toastMessage ?? this.toastMessage,
      );

  @override
  List<Object?> get props => [image, toastMessage];
}
