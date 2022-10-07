// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// class WishListEntity extends Equatable {
//   @JsonKey(name: 'id', defaultValue: 0)
//   final int id;
//   @JsonKey(name: 'gallery', defaultValue: [])
//   final List<String> image;
//   @JsonKey(name: 'description', defaultValue: '')
//   final String description;
//   @JsonKey(name: 'price', defaultValue: '')
//   final String price;
//   @JsonKey(name: 'discount', defaultValue: '')
//   final String discount;
//   @JsonKey(name: 'absolute_car_name', defaultValue: '')
//   final String absoluteCarName;
//   @JsonKey(name: 'is_new', defaultValue: false)
//   final bool isNew;
//   @JsonKey(name: 'user_type', defaultValue: '')
//   final String userType;
//   @DealerEntityConverter()
//   final DealerEntity dealer;
//
//   @override
//   List<Object?> get props => [];
// }
//
// class DealerEntity extends Equatable {
//   @JsonKey(name: 'id', defaultValue: 0)
//   final int id;
//   @JsonKey(name: 'name', defaultValue: '')
//   final String name;
//   @JsonKey(name: 'avatar', defaultValue: '')
//   final String avatar;
//
//   const DealerEntity({
//     required this.name,
//     required this.id,
//     required this.avatar,
//   });
//
//   @override
//   List<Object?> get props => [name, id, avatar];
// }
//
// class DealerEntityConverter extends JsonConverter<DealerEntity, Map<String, dynamic>?> {
//   const DealerEntityConverter();
//
//   @override
//   DealerEntity fromJson(Map<String, dynamic>? json) => DealerModel.fromJson(json ?? {});
//
//   @override
//   Map<String, dynamic> toJson(DealerEntity object) => {};
// }
//
// class UserMiniEntity extends Equatable {
//   @JsonKey(name: 'id', defaultValue: 0)
//   final int id;
//   @JsonKey(name: 'full_name', defaultValue: '')
//   final String fullName;
//   @override
//   List<Object?> get props => [];
// }
