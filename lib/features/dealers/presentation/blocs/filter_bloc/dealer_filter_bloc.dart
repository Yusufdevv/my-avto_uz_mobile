
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dealer_filter_event.dart';

part 'dealer_filter_state.dart';

class DealerFilterBloc extends Bloc<DealerFilterEvent, DealerFilterState> {
  final List<Region>? region;
  final MakeEntity? maker;
  final String? carType;

  DealerFilterBloc({
    this.region,
    this.maker,
    this.carType,
  }) : super(DealerFilterState(
          maker: maker,
          region: region ?? <Region>[],
          carType: carType,
        )) {
    on<DealerFilterClearEvent>((event, emit) => emit(const DealerFilterState(
          region: <Region>[],
          carType: '',
        )));
    on<DealerFilterSelectEvent>(
      (event, emit) {
        emit(state.copyWith(
            region: event.region,
            maker: event.maker,
            carType: event.carType));
      },
    );
  }
}
