part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class ShowFilterEvent extends FilterEvent{
  @override
  List<Object?> get props =>[];
}


class MileageFilterEvent extends FilterEvent{
  @override
  List<Object?> get props =>[];
}


class RegionFilterEvent extends FilterEvent{
  @override
  List<Object?> get props =>[];
}

class BrandFilterEvent extends FilterEvent{
  @override
  List<Object?> get props =>[];
}
class BodyFilterEvent extends FilterEvent{
  @override
  List<Object?> get props =>[];
}

class ClassFilterEvent extends FilterEvent {
  @override
  List<Object?> get props => [];
}

class GearFilterEvent extends FilterEvent{
  @override
  List<Object?> get props => [];
}

class CaseFilterEvent extends FilterEvent{
  @override
  List<Object?> get props => [];
}


class YearFilterEvent extends FilterEvent{
  @override
  List<Object?> get props => [];
}

class PriceFilterEvent extends FilterEvent{
  @override
  List<Object?> get props => [];
}
