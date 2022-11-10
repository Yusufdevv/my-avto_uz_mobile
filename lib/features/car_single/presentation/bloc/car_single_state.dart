part of 'car_single_bloc.dart';

class CarSingleState extends Equatable {
  final FormzStatus status;
  final List<String> images;
  final CarSingleEntity entity;
  final List<OtherAdsEntity> otherEntity;

  const CarSingleState({
    required this.status,
    required this.entity,
    required this.images,
    required this.otherEntity,
  });

  CarSingleState copyWith({
    FormzStatus? status,
    List<String>? images,
    CarSingleEntity? entity,
    List<OtherAdsEntity>? otherEntity,
  }) =>
      CarSingleState(
          status: status ?? this.status,
          entity: entity ?? this.entity,
          images: images ?? this.images,
          otherEntity: otherEntity ?? this.otherEntity);

  @override
  List<Object?> get props => throw UnimplementedError();
}
