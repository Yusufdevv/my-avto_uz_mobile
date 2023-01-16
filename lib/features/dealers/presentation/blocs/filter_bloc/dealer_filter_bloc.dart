import 'dart:async';

import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/dealers/domain/entities/make_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dealer_filter_event.dart';
part 'dealer_filter_state.dart';

// class DealerFilterBloc extends Bloc<DealerFilterEvent, DealerFilterState> {
//   final List<Region>? regions;
//   final MakeEntity? maker;
//   final bool? car_type;
//   DealerFilterBloc({
//     this.regions,
//     this.maker,
//     this.car_type,
//   }) : super(DealerFilterState(
//     car_type: car_type,
//     maker: maker,
//     regions: regions ?? <Region>[],
//   )) {
//     on<FilterClearEvent>((event, emit) => emit(FilterState(
//       ischeck: false,
//       regions: const <Region>[],
//       yearValues: RangeValues(1960, DateTime.now().year + 0),
//       priceValues: const RangeValues(1000, 500000),
//     )));
//     on<FilterSelectEvent>((event, emit) {
//       emit(state.copyWith(
//         bodyType: event.bodyType,
//         carDriveType: event.carDriveType,
//         gearboxType: event.gearboxType,
//         maker: event.maker,
//         priceValues: event.priceValues,
//         yearValues: event.yearValues,
//         regions: event.regions,
//         idVal: event.idVal,
//         ischeck: true,
//       ));
//     });
//   }
// }
//
