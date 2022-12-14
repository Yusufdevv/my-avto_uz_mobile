part of 'image_bloc.dart';

class ImageState extends Equatable {
  final List<String> images;
  final File image;

  const ImageState({
    required this.image,
    required this.images,
  });

  ImageState copyWith({
    List<String>? images,
    File? image,
  }) =>
      ImageState(
        images: images ?? this.images,
        image: image ?? this.image,
      );

  @override
  List<Object?> get props => [images, image];
}
