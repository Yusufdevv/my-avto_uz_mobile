import 'dart:async';

import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/dealers/domain/entities/make_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dealer_filter_event.dart';

part 'dealer_filter_state.dart';

class DealerFilterBloc extends Bloc<DealerFilterEvent, DealerFilterState> {
  final List<Region>? region;
  final MakeEntity? maker;
  final String? car_type;

  DealerFilterBloc({
    this.region,
    this.maker,
    this.car_type,
  }) : super(DealerFilterState(
          maker: maker,
          region: region ?? <Region>[],
          car_type: car_type,
        )) {
    on<DealerFilterClearEvent>((event, emit) => emit(const DealerFilterState(
          region: <Region>[],
          car_type: '',
        )));
    on<DealerFilterSelectEvent>(
      (event, emit) {
        emit(state.copyWith(
            region: event.region,
            maker: event.maker,
            car_type: event.car_type));
      },
    );
  }
}
