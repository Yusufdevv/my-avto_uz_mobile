import 'package:auto/features/common/domain/model/token_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class RegisterModel extends Equatable {
  @JsonKey(name: 'full_name', )
  final String fullName;
  @JsonKey(name: 'region', )
  final int region;
  @JsonKey(name: 'phone_number', )
  final String phoneNumber;
  @JsonKey(name: 'email', )
  final String email;
  @JsonKey(name: 'password', )
  final String password;
  @JsonKey(name: 'image', )
  final String image;


  const RegisterModel(
      { this.password='',
       this.phoneNumber='',
       this.email='',
        this.image='',
       this.fullName='',
       this.region=0});

  RegisterModel copyWith({
    String? fullName,
    int? region,
    String? phoneNumber,
    String? email,
    String? password,
    String? image,
  }) =>
      RegisterModel(image: image??this.image,
          password: password ?? this.password,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          email: email ?? this.email,
          fullName: fullName ?? this.fullName,
          region: region ?? this.region);

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  @override
  List<Object?> get props => [
    fullName,
    region,
    phoneNumber,
    email,
    password,image
  ];
}
