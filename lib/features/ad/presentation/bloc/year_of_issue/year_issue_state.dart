part of 'year_issue_bloc.dart';

class YearIssueState extends Equatable {
  final int selectedId;
  final int confirmId;

  const YearIssueState({required this.selectedId, required this.confirmId});

  YearIssueState copyWith({int? selectedId, int? confirmId}) => YearIssueState(
      selectedId: selectedId ?? this.selectedId,
      confirmId: confirmId ?? this.confirmId);

  @override
  List<Object?> get props => [confirmId, selectedId];
}
