part of 'deep_link_bloc.dart';

abstract class DeepLinkEvent {}

class DeepLinkChangedEvent extends DeepLinkEvent {
  final String uri;

  DeepLinkChangedEvent({required this.uri});
}
