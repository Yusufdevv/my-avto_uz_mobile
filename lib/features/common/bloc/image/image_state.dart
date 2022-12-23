part of 'image_bloc.dart';

@immutable
class ImageState extends Equatable {
  final File image;

  const ImageState({required this.image});

  @override
  List<Object?> get props => [image];
}
