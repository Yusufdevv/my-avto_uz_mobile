import 'package:auto/features/ad/domain/entities/types/make.dart';

class GetMakeEntity {
  const GetMakeEntity({
    this.count = 0,
    this.next = '',
    this.previous = '',
    this.results = const [],
  });

  final int count;
  final String next;
  final String previous;
  @MakeEntityConverter()
  final List<MakeEntity> results;
}
