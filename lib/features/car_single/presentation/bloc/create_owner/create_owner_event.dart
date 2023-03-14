part of 'create_owner_bloc.dart';

@immutable
abstract class CreateOwnerEvent {}

class VerifyOwnerCreateEvent extends CreateOwnerEvent {
  final CreateOwnerModel createOwnerModel;

  VerifyOwnerCreateEvent({required this.createOwnerModel});
}
