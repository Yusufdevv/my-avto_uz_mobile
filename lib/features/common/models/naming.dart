import 'package:json_annotation/json_annotation.dart';

part 'naming.g.dart';


@JsonSerializable()
class NamingModel {
  @JsonKey(name: 'id',defaultValue: 0)
  final int id;
  @JsonKey(name: 'name',defaultValue: '')
  final String name;

  NamingModel({required this.id,required this.name});

  factory NamingModel.fromJson(Map<String,dynamic> json)=>_$NamingModelFromJson(json);
}