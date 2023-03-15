part of 'reels_service_bloc.dart';

@immutable
class ReelsServiceState extends Equatable {
  final List<TarifEntity> tarifs;
  final String invoiceStatus;
  final FormzStatus status;
  final FormzStatus payStatus;
  final TransactionStatus transactionStatus;
  final bool fetchMoreTarifs;
  final PaymentEntity paymentEntity;
  final String provider;
  final String selectedTarif;
  final int announcementId;
  final List<String> images;
  final List<String> videos;

  const ReelsServiceState({
    required this.tarifs,
    required this.status,
    required this.payStatus,
    required this.invoiceStatus,
    required this.fetchMoreTarifs,
    required this.paymentEntity,
    required this.provider,
    required this.selectedTarif,
    required this.announcementId,
    required this.images,
    required this.videos,
    this.transactionStatus = TransactionStatus.waiting,
  });

  ReelsServiceState copyWith({
    List<TarifEntity>? tarifs,
    List<String>? images,
    List<String>? videos,
    String? invoiceStatus,
    FormzStatus? status,
    FormzStatus? payStatus,
    TransactionStatus? transactionStatus,
    bool? fetchMoreTarifs,
    PaymentEntity? paymentEntity,
    String? provider,
    String? selectedTarif,
    int? announcementId,
  }) =>
      ReelsServiceState(
          tarifs: tarifs ?? this.tarifs,
          images: images ?? this.images,
          videos: videos ?? this.videos,
          status: status ?? this.status,
          provider: provider ?? this.provider,
          announcementId: announcementId ?? this.announcementId,
          selectedTarif: selectedTarif ?? this.selectedTarif,
          payStatus: payStatus ?? this.payStatus,
          invoiceStatus: invoiceStatus ?? this.invoiceStatus,
          fetchMoreTarifs: fetchMoreTarifs ?? this.fetchMoreTarifs,
          paymentEntity: paymentEntity ?? this.paymentEntity,
          transactionStatus: transactionStatus ?? this.transactionStatus);

  @override
  List<Object?> get props => [
        tarifs,
        status,
        invoiceStatus,
        fetchMoreTarifs,
        payStatus,
        paymentEntity,
        transactionStatus,
        provider,
        selectedTarif,
        announcementId,
        images,
        videos
      ];
}
