import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dealer_filter_event.dart';

part 'dealer_filter_state.dart';

class DealerFilterBloc extends Bloc<DealerFilterEvent, DealerFilterState> {
  final List<RegionEntity>? region;
  final MakeEntity? maker;
  final String? carType;

  DealerFilterBloc({
    this.region,
    this.maker,
    this.carType,
  }) : super(DealerFilterState(
          maker: maker ?? const MakeEntity(),
          region: region ?? <RegionEntity>[],
          carType: carType,
        )) {
    on<DealerFilterClearEvent>((event, emit) => emit(const DealerFilterState(
          region: <RegionEntity>[],
          carType: '',
          maker: MakeEntity(),
        )));
    on<DealerFilterSelectEvent>(
      (event, emit) {
        emit(state.copyWith(
            region: event.region, maker: event.maker, carType: event.carType));
      },
    );
  }
}
