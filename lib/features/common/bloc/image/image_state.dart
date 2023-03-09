part of 'image_bloc.dart';

@immutable
class ImageState extends Equatable {
  final File image;
  final List<String> images;
  final String secondImage;

  const ImageState(
      {required this.image, required this.images, required this.secondImage});

  ImageState copyWith({
    File? image,
    List<String>? images,
    String? secondImage,
  }) => ImageState(
        image: image ?? this.image,
        images: images ?? this.images,
        secondImage: secondImage ?? this.secondImage);

  @override
  List<Object?> get props => [image, images, secondImage];
}
