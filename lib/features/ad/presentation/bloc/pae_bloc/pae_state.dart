part of 'pae_bloc.dart';

class PaeState extends Equatable {
  final bool goTo;
  const PaeState({this.goTo = false});
  PaeState copyWith({bool? goTo}) => PaeState(goTo: goTo ?? this.goTo);
  @override
  List<Object?> get props => [goTo];
}
