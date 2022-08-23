import 'package:json_annotation/json_annotation.dart';

part 'titler.g.dart';


@JsonSerializable()
class TitlerModel {
  @JsonKey(name: 'id',defaultValue: 0)
  final int id;
  @JsonKey(name: 'name',defaultValue: '')
  final String name;

  TitlerModel({ this.id=0, this.name=''});

  factory TitlerModel.fromJson(Map<String,dynamic> json)=>_$TitlerModelFromJson(json);
}