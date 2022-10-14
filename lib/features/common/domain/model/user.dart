import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'username',)
  final String userName;
  @JsonKey(name: 'last_name',)
  final String lastName;
  @JsonKey(name: 'first_name', )
  final String firstName;
  @JsonKey(name: 'full_name',)
  final String fullName;
  @JsonKey(name: 'phone',)
  final String phone;
  @JsonKey(name: 'email',)
  final String email;
  @JsonKey(name: 'image',)
  final String image;
  @JsonKey(name: 'region',)
  final int region;
  @JsonKey(name: 'phone_number',)
  final String phoneNumber;


  const UserModel(
      { this.phone='',
        this.phoneNumber='',
        this.region=0,
        this.email='',
        this.image='',
        this.firstName='',
        this.id=0,
        this.lastName='',
        this.fullName='',

        this.userName=''});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}