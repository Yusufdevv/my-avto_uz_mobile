part of 'date_picker_bloc.dart';

class DatePickerState extends Equatable {
  final String date;
  const DatePickerState({required this.date});

  DatePickerState copyWith({String? date}) =>
      DatePickerState(date: date ?? this.date);
  @override
  List<Object?> get props => [date];
}
