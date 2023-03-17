import 'package:equatable/equatable.dart';

class GetPaginationParam extends Equatable {
  final int offset;
  final int limit;
  final String? name;
  final String? next;

  const GetPaginationParam({
    this.offset = 0,
    this.limit = 1000,
    this.name,
    this.next,
  });

  @override
  List<Object?> get props => [
        name,
        offset,
        limit,
        next,
      ];
}
