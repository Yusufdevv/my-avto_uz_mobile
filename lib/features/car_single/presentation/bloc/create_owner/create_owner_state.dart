part of 'create_owner_bloc.dart';

@immutable
class CreateOwnerState extends Equatable {
  final CreateOwnerModel createOwnerModel;
  final FormzStatus status;
  final bool showModerationBtn;
  final bool showMoreBtn;
  final bool isDeleted;
  final bool refresh;

  const CreateOwnerState({
    required this.status,
    required this.createOwnerModel,
    this.showModerationBtn = false,
    this.showMoreBtn = false,
    this.refresh = false,
    this.isDeleted = false,
  });

  CreateOwnerState copyWith({
    CreateOwnerModel? createOwnerModel,
    FormzStatus? status,
    bool? showModerationBtn,
    bool? showMoreBtn,
    bool? isDeleted,
    bool? refresh,
  }) =>
      CreateOwnerState(
        status: status ?? this.status,
        showMoreBtn: showMoreBtn ?? this.showMoreBtn,
        isDeleted: isDeleted ?? this.isDeleted,
        refresh: refresh ?? this.refresh,
        showModerationBtn: showModerationBtn ?? this.showModerationBtn,
        createOwnerModel: createOwnerModel ?? this.createOwnerModel,
      );

  @override
  List<Object?> get props => [
        createOwnerModel,
        showMoreBtn,
        status,
        showModerationBtn,
        isDeleted,
        refresh
      ];
}
