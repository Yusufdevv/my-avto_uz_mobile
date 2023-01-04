part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  const MainEvent();
}

class InitialEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}
