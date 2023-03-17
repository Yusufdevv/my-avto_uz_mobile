part of 'invoice_bloc.dart';

@immutable
class InvoiceState extends Equatable {
  final List<TarifEntity> tarifs;
  final String invoiceStatus;
  final FormzStatus status;
  final FormzStatus payStatus;
  final TransactionStatus transactionStatus;
  final bool fetchMoreTarifs;
  final PaymentEntity paymentEntity;
  final int announcementId;
  final Map<String, dynamic> params;
  final String media;

  const InvoiceState({
    required this.tarifs,
    required this.status,
    required this.payStatus,
    required this.invoiceStatus,
    required this.fetchMoreTarifs,
    required this.paymentEntity,
    required this.params,
    required this.announcementId,
    required this.media,
    this.transactionStatus = TransactionStatus.waiting,
  });

  InvoiceState copyWith({
    List<TarifEntity>? tarifs,
    String? invoiceStatus,
    FormzStatus? status,
    FormzStatus? payStatus,
    TransactionStatus? transactionStatus,
    bool? fetchMoreTarifs,
    PaymentEntity? paymentEntity,
    int? announcementId,
    String? media,
    Map<String, dynamic>? params,
  }) =>
      InvoiceState(
          tarifs: tarifs ?? this.tarifs,
          status: status ?? this.status,
          params: params ?? this.params,
          media: media ?? this.media,
          announcementId: announcementId ?? this.announcementId,
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
        params,
        announcementId,
        media,
      ];
}
