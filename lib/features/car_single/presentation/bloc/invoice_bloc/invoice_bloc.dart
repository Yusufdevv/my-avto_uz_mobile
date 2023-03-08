import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/domain/entities/payment_entity.dart';
import 'package:auto/features/car_single/domain/entities/tarif_entity.dart';
import 'package:auto/features/car_single/domain/usecases/get_invoice_status_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/get_tarifs_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/pay_invoice_usecase.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'invoice_event.dart';

part 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  final PayInvoiceUseCase _payInvoiceUseCase = PayInvoiceUseCase();
  final GetTarifsUseCase getTarifsUseCase = GetTarifsUseCase();
  final GetStatusInvoiceUseCase _getStatusInvoiceUseCase =
      GetStatusInvoiceUseCase();

  InvoiceBloc()
      : super(const InvoiceState(
          tarifs: [],
          status: FormzStatus.pure,
          payStatus: FormzStatus.pure,
          invoiceStatus: '',
          fetchMoreTarifs: false,
          paymentEntity: const PaymentEntity(),
        )) {
    ///
    on<PayInvoiceEvent>((event, emit) async {
      emit(state.copyWith(payStatus: FormzStatus.submissionInProgress));
      final result = await _payInvoiceUseCase.call(
        {
          'announcement': event.announcement,
          'provider': event.provider,
          'redirect_url': '/',
          'tariff_type': event.tariffType
        },
      );
      if (result.isRight) {
        emit(state.copyWith(
          paymentEntity: result.right,
          payStatus: FormzStatus.submissionSuccess,
        ));
        event.onSucces(result.right.paymentUrl ?? '');
      } else {
        emit(state.copyWith(payStatus: FormzStatus.submissionFailure));
      }
    });

    ///
    on<GetTarifsEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getTarifsUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          tarifs: result.right.results,
          status: FormzStatus.submissionSuccess,
          fetchMoreTarifs: result.right.next != null,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    ///
    on<GetTransactionStatusEvent>((event, emit) async {
      final result = await _getStatusInvoiceUseCase.call(event.orderId);
      if (result.isRight) {
        emit(state.copyWith(
          invoiceStatus: result.right,
          transactionStatus: MyFunctions.strToTransactionStatus(result.right)
        ));
        event.onSucces();
      } else {
        emit(state.copyWith(transactionStatus: TransactionStatus.failed));
      }
    });
  }
}
