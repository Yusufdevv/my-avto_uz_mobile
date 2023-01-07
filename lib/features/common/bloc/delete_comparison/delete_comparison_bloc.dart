import 'package:auto/features/comparison/domain/usecases/delete_comparison.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_comparison_event.dart';
part 'delete_comparison_state.dart';
part 'delete_comparison_bloc.freezed.dart';

class DeleteComparisonBloc
    extends Bloc<DeleteComparisonEvent, DeleteComparisonState> {
  final DeleteComparisonUseCase useCase;
  DeleteComparisonBloc({required this.useCase})
      : super(const DeleteComparisonState()) {
    on<_DeleteComparisonE>((event, emit) async {
      final result = await useCase.call(event.id);
    });
  }
}
