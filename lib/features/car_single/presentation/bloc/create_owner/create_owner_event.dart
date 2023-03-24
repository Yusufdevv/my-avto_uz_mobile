part of 'create_owner_bloc.dart';

@immutable
abstract class CreateOwnerEvent {}

class VerifyOwnerCreateEvent extends CreateOwnerEvent {
  final CreateOwnerModel createOwnerModel;
  final Function() onSuccess;
  final Function() onError;

  VerifyOwnerCreateEvent({
    required this.createOwnerModel,
    required this.onSuccess,
    required this.onError,
  });
}

class ChangeUIStatusEvent extends CreateOwnerEvent {
  final bool refresh;

  ChangeUIStatusEvent({
    required this.refresh,
  });
}

class ReApplicationEvent extends CreateOwnerEvent {
  final bool refresh;

  ReApplicationEvent({
    required this.refresh,
  });
}

class SetRejectedStatusEvent extends CreateOwnerEvent {
  final bool rejected;

  SetRejectedStatusEvent({
    required this.rejected,
  });
}

class DeleteApplicaitionEvent extends CreateOwnerEvent {
  final int id;

  DeleteApplicaitionEvent({required this.id});
}
