part of 'year_issue_bloc.dart';

class YearIssueState extends Equatable {
  final List<YearsEntity> yearsEntity;
  final FormzStatus status;
  final int selectedId;
  final int confirmId;

  const YearIssueState(
      {required this.status,
      required this.yearsEntity,
      required this.selectedId,
      required this.confirmId});

  YearIssueState copyWith(
          {int? selectedId,
          int? confirmId,
          FormzStatus? status,
          List<YearsEntity>? yearsEntity}) =>
      YearIssueState(
        yearsEntity: yearsEntity ?? this.yearsEntity,
        status: status ?? this.status,
        selectedId: selectedId ?? this.selectedId,
        confirmId: confirmId ?? this.confirmId,
      );

  @override
  List<Object?> get props => [confirmId, selectedId, status, yearsEntity];
}
