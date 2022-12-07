part of 'car_single_bloc.dart';

class CarSingleState extends Equatable {
  final FormzStatus status;
  final List<String> images;
  final CarSingleEntity entity;
  final List<OtherAdsEntity> otherEntity;
  final bool isScroll;

  const CarSingleState({
    required this.isScroll,
    required this.status,
    required this.entity,
    required this.images,
    required this.otherEntity,
  });

  CarSingleState copyWith({
    bool? isScroll,
    FormzStatus? status,
    List<String>? images,
    CarSingleEntity? entity,
    List<OtherAdsEntity>? otherEntity,
  }) =>
      CarSingleState(
        isScroll: isScroll ?? this.isScroll,
          status: status ?? this.status,
          entity: entity ?? this.entity,
          images: images ?? this.images,
          otherEntity: otherEntity ?? this.otherEntity);

  @override
  List<Object?> get props => [isScroll,status,entity, images, otherEntity];
}
