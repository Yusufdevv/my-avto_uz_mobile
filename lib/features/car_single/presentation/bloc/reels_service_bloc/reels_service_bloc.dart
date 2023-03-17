import 'dart:io';

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
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'reels_service_event.dart';

part 'reels_service_state.dart';

class ReelsServiceBloc extends Bloc<ReelsServiceEvent, ReelsServiceState> {
  final PayInvoiceUseCase _payInvoiceUseCase = PayInvoiceUseCase();
  final GetTarifsUseCase getTarifsUseCase = GetTarifsUseCase();
  final GetStatusInvoiceUseCase _getStatusInvoiceUseCase =
      GetStatusInvoiceUseCase();
  final ImagePicker picker = ImagePicker();

  ReelsServiceBloc()
      : super(
          const ReelsServiceState(
              tarifs: [],
              status: FormzStatus.pure,
              payStatus: FormzStatus.pure,
              invoiceStatus: '',
              fetchMoreTarifs: false,
              paymentEntity: PaymentEntity(),
              announcementId: -1,
              provider: 'payme',
              selectedTarif: '',
              images: [],
              videos: []),
        ) {
    //
    on<PickImagesEvent>((event, emit) async {
      final permission = event.source == ImageSource.camera
          ? await MyFunctions.getCameraPermission(Platform.isAndroid)
          : await MyFunctions.getPhotosPermission(Platform.isAndroid);

      if (permission.isGranted) {
        final image =
            await picker.pickImage(source: event.source, imageQuality: 90);
        if (image != null) {
          emit(state.copyWith(images: [image.path, ...state.images]));
        }
      }
    });

    on<DeleteImageVideoEvent>((event, emit) {
      final images = <String>[...state.images];
      final videos = <String>[...state.videos];
      if (images.contains(event.path)) {
        images.remove(event.path);
      }
      if (videos.contains(event.path)) {
        videos.remove(event.path);
      }
      emit(state.copyWith(images: images, videos: videos));
    });

    on<PickVideosEvent>((event, emit) async {
      final permission = event.source == ImageSource.camera
          ? await MyFunctions.getCameraPermission(Platform.isAndroid)
          : await MyFunctions.getPhotosPermission(Platform.isAndroid);

      if (permission.isGranted) {
        final image =
            await picker.pickVideo(source: event.source);
        if (image != null) {
          emit(state.copyWith(videos: [image.path, ...state.videos]));
        }
      }
    });

    ///
    on<PayReelsInvoiceEvent>((event, emit) async {
      emit(state.copyWith(
        payStatus: FormzStatus.submissionInProgress,
        announcementId: event.announcement,
        provider: event.provider,
        selectedTarif: event.tariffType,
        transactionStatus: TransactionStatus.waiting,
      ));

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
    on<GetReelsTarifsEvent>((event, emit) async {
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
    on<GetReelsTransactionStatusEvent>((event, emit) async {
      final result = await _getStatusInvoiceUseCase.call(event.orderId);
      if (result.isRight) {
        emit(state.copyWith(
            invoiceStatus: result.right,
            transactionStatus:
                MyFunctions.strToTransactionStatus(result.right)));
        event.onSucces();
      } else {
        emit(state.copyWith(transactionStatus: TransactionStatus.failed));
      }
    });

    on<SetReelsProviderEvent>((event, emit) {
      emit(state.copyWith(provider: event.provider));
    });
  }
}
