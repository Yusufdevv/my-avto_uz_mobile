import 'package:freezed_annotation/freezed_annotation.dart';


part 'generic_pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericPagination<T>{
  @JsonKey(name: 'count',defaultValue: 0)
  final int count;
  @JsonKey(name: 'results',defaultValue: [])
  final List<T> results;
  @JsonKey(name: 'next',defaultValue: '')
  final String   next;

  GenericPagination({required this.count,required this.next,required this.results});
  factory GenericPagination.fromJson(Map<String,dynamic> json,T Function(Object?) fetch)=>_$GenericPaginationFromJson(json,fetch);
}