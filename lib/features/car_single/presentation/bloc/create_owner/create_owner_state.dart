part of 'create_owner_bloc.dart';

@immutable
class CreateOwnerState extends Equatable {
  final CreateOwnerModel createOwnerModel;
  final FormzStatus status;

  const CreateOwnerState({
    required this.status,
    required this.createOwnerModel,
  });

  CreateOwnerState copyWith({
    CreateOwnerModel? createOwnerModel,
    FormzStatus? status,
  }) =>
      CreateOwnerState(
        status: status ?? this.status,
        createOwnerModel: createOwnerModel ?? this.createOwnerModel,
      );

  @override
  List<Object?> get props => [
        createOwnerModel,
        status,
      ];
}
