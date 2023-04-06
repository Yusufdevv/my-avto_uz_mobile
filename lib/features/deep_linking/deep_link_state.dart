part of 'deep_link_bloc.dart';

abstract class DeepLinkState {}

class DeepLinkInitial extends DeepLinkState {}

class DeepLinkTriggeredByReelState extends DeepLinkState {
  DeepLinkTriggeredByReelState();
}
