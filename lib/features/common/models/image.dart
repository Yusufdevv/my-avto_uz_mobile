import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageModel {
  @JsonKey(name: 'id',defaultValue: 0)
  final int id ;
  @JsonKey(name: 'img',defaultValue: '')
  final String image;
  @JsonKey(name: 'img_size',defaultValue: 0)
  final int imageSize;
  ImageModel({this.id=0,this.image='',this.imageSize=0});

 factory ImageModel.fromJson(Map<String,dynamic> json)=>_$ImageModelFromJson(json);
}