part of 'internet_bloc.dart';

class InternetState extends Equatable {
  final bool isConnected;

  const InternetState({
    required this.isConnected,
  });

  InternetState copyWith({bool? isConnected}) => InternetState(
        isConnected: isConnected ?? this.isConnected,
      );

  @override
  List<Object?> get props => [isConnected];
}
