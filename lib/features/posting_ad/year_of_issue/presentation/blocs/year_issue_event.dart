part of 'year_issue_bloc.dart';

abstract class YearIssueEvent extends Equatable {
  const YearIssueEvent();
}


class SelectedYearEvent extends YearIssueEvent{

  final int id;
  const SelectedYearEvent({required this.id});


  @override
  List<Object?> get props => [id];
}


class ConfirmYearEvent extends YearIssueEvent{
  const ConfirmYearEvent();

  @override
  List<Object?> get props => [];

}


class RevertYearEvent extends YearIssueEvent{
  const RevertYearEvent();

  @override
  List<Object?> get props => [];

}