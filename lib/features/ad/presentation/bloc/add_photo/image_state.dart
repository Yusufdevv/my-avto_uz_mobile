part of 'image_bloc.dart';

class ImageState extends Equatable {
  final List<String> images;
  final List<String> panaramaImages;
  final File image;

  const ImageState({
    required this.panaramaImages,
    required this.image,
    required this.images,
  });

  ImageState copyWith({
    List<String>? images,
    List<String>? panaramaImages,
    File? image,
  }) =>
      ImageState(
        panaramaImages: panaramaImages ?? this.panaramaImages,
        images: images ?? this.images,
        image: image ?? this.image,
      );

  @override
  List<Object?> get props => [
        images,
        image,
        panaramaImages,
      ];
}
