part of 'reels_service_bloc.dart';

@immutable
abstract class ReelsServiceEvent {}

class GetReelsTarifsEvent extends ReelsServiceEvent {}

class SetReelsProviderEvent extends ReelsServiceEvent {
  final String provider;

  SetReelsProviderEvent({required this.provider});
}
class PickImagesEvent extends ReelsServiceEvent {
  final ImageSource source;

  PickImagesEvent({required this.source});
}
class DeleteImageVideoEvent extends ReelsServiceEvent {
  final String path;

  DeleteImageVideoEvent({required this.path});
}
class PickVideosEvent extends ReelsServiceEvent {
  final ImageSource source;

  PickVideosEvent({required this.source});
}

class PayReelsInvoiceEvent extends ReelsServiceEvent {
  final int announcement;
  final String provider;
  final String tariffType;
  final Function(String) onSucces;
  final Function() onError;

  PayReelsInvoiceEvent({
    required this.announcement,
    required this.provider,
    required this.tariffType,
    required this.onSucces,
    required this.onError,
  });
}

class GetReelsTransactionStatusEvent extends ReelsServiceEvent {
  final Function() onSucces;
  final Function() onError;
  final int orderId;

  GetReelsTransactionStatusEvent({
    required this.onSucces,
    required this.onError,
    required this.orderId,
  });
}
