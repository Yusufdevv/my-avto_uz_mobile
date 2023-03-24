import 'dart:async';

import 'package:auto/features/profile/domain/entities/car_product.dart';
import 'package:auto/features/profile/domain/usecases/product_category_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'directory_products_event.dart';

part 'directory_products_state.dart';

class DirectoryProductsBloc
    extends Bloc<DirectoryProductsEvent, DirectoryProductsState> {
  GetCarProductByCategory useCase = GetCarProductByCategory();

  DirectoryProductsBloc()
      : super(const DirectoryProductsState(status: FormzStatus.pure)) {
    on<DirectoryProductsGetEvent>(_get);
  }

  FutureOr<void> _get(DirectoryProductsGetEvent event,
      Emitter<DirectoryProductsState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await useCase.call(SlugId(slug: event.slug, id: event.id));
    if (result.isRight) {
      emit(state.copyWith(
          products: result.right.results,
          status: FormzStatus.submissionSuccess));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
