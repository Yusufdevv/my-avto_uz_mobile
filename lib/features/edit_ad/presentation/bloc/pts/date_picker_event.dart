part of 'date_picker_bloc.dart';

abstract class DatePickerEvent extends Equatable {
  const DatePickerEvent();
}

class PickedDate extends DatePickerEvent {
  final String date;
  const PickedDate({required this.date});
  @override
  List<Object?> get props => [date];
}
