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
import 'package:file_picker/file_picker.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'invoice_event.dart';

part 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  final PayInvoiceUseCase _payInvoiceUseCase = PayInvoiceUseCase();
  final GetTarifsUseCase getTarifsUseCase = GetTarifsUseCase();
  final GetStatusInvoiceUseCase _getStatusInvoiceUseCase =
      GetStatusInvoiceUseCase();
  final ImagePicker picker = ImagePicker();

  InvoiceBloc()
      : super(
          const InvoiceState(
              tarifs: [],
              status: FormzStatus.pure,
              payStatus: FormzStatus.pure,
              invoiceStatus: '',
              fetchMoreTarifs: false,
              paymentEntity: PaymentEntity(),
              announcementId: -1,
              params: {},
              media: '',
              video: ''),
        ) {
    ///
    on<PayInvoiceEvent>((event, emit) async {
      emit(state.copyWith(
        payStatus: FormzStatus.submissionInProgress,
        announcementId: event.announcement,
        transactionStatus: TransactionStatus.waiting,
        params: event.params,
      ));

      final result = await _payInvoiceUseCase.call(event.params);
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
        var tarifs = <TarifEntity>[];
        if (event.tarifType == TarifTypeEnum.none) {
          for (var i = 0; i < result.right.results.length; i++) {
            if (result.right.results[i].type
                    .contains(TarifTypeEnum.vip.value) ||
                result.right.results[i].type
                    .contains(TarifTypeEnum.hot.value) ||
                result.right.results[i].type
                    .contains(TarifTypeEnum.top.value)) {
              continue;
            } else {
              tarifs.add(result.right.results[i]);
            }
          }
        } else {
          tarifs = result.right.results
              .where((e) => e.type.contains(event.tarifType.value))
              .toList();
        }
        emit(state.copyWith(
          tarifs: tarifs,
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
            transactionStatus:
                MyFunctions.strToTransactionStatus(result.right)));
        event.onSucces();
      } else {
        emit(state.copyWith(transactionStatus: TransactionStatus.failed));
      }
    });

    on<PickImageEvent>((event, emit) async {
      final permission = event.source == ImageSource.camera
          ? await MyFunctions.getCameraPermission(Platform.isAndroid)
          : await MyFunctions.getPhotosPermission(Platform.isAndroid);

      if (permission.isGranted) {
        if (event.index == 0) {
          final media =
              await picker.pickImage(source: event.source, imageQuality: 90);
          if (media != null) {
            emit(state.copyWith(media: media.path));
          }
        } else if (event.index == 1) {
          final media = await picker.pickVideo(source: event.source);
          if (media != null) {
            final thumbnailPath = await VideoThumbnail.thumbnailFile(
              video: media.path,
              imageFormat: ImageFormat.PNG,
              maxWidth: 128,
              quality: 90,
            );
            emit(state.copyWith(media: thumbnailPath, video: media.path));
          }
        } else if (event.index == 2) {
          final result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['mp4', 'jpg', 'jpeg', 'png'],
          );
          if (result != null) {
            if (result.files.single.extension == 'mp4') {
              final thumbnailPath = await VideoThumbnail.thumbnailFile(
                video: result.files.single.path ?? '',
                imageFormat: ImageFormat.PNG,
                maxWidth: 128,
                quality: 90,
              );

              emit(state.copyWith(
                  media: thumbnailPath, video: result.files.single.path));
            } else {
              emit(state.copyWith(media: result.files.single.path));
            }
          }
        }
      }
    });

    on<DeleteImageVideoEvent>((event, emit) {
      var media = state.media;
      var video = state.video;

      if (media == event.path) {
        media = '';
        video = '';
      }
      emit(state.copyWith(media: media, video: video));
    });
  }
}
