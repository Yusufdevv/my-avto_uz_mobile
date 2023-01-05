part of 'change_car_bloc.dart';

abstract class ChangeCarEvent extends Equatable {
  const ChangeCarEvent();
}

class SelectedChangeCarItemEvent extends ChangeCarEvent{
  final int id;
  const SelectedChangeCarItemEvent({required this.id});
  @override
  List<Object?> get props => [id];
}


class ConfirmChangeCarOption extends ChangeCarEvent{

  const ConfirmChangeCarOption();

  @override
  List<Object?> get props => [];
}

class RevertChangeCarOption extends ChangeCarEvent{

  const RevertChangeCarOption();

  @override
  List<Object?> get props => [];

}