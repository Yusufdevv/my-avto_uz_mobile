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
  final String provider;
  final String selectedTarif;
  final int announcementId;

  const InvoiceState({
    required this.tarifs,
    required this.status,
    required this.payStatus,
    required this.invoiceStatus,
    required this.fetchMoreTarifs,
    required this.paymentEntity,
    required this.provider,
    required this.selectedTarif,
    required this.announcementId,
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
    String? provider,
    String? selectedTarif,
    int? announcementId,
  }) =>
      InvoiceState(
          tarifs: tarifs ?? this.tarifs,
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
      ];
}
