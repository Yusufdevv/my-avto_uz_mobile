part of 'image_bloc.dart';

 class ImageState extends Equatable {

   final List<String> images;
  const ImageState({
     required this.images,
 });

  ImageState copyWith({
   List<String>? images
 }) => ImageState(images: images ?? this.images);
  @override
  List<Object?> get props => [images];
}
