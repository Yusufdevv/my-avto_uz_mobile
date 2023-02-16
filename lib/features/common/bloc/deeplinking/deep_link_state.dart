part of 'deep_link_bloc.dart';

abstract class DeepLinkState extends Equatable {
  const DeepLinkState();
}

class DeepLinkInitial extends DeepLinkState {
  @override
  List<Object> get props => [];
}

class MusofirLinkTriggered extends DeepLinkState {
  final int musofirId;
  const MusofirLinkTriggered(this.musofirId);
  @override
  List<Object?> get props => [musofirId];
}

class UserLinkTriggered extends DeepLinkState {
  final int userId;
  const UserLinkTriggered(this.userId);
  @override
  List<Object?> get props => [userId];
}
