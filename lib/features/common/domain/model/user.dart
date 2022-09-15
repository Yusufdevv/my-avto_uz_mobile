import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'pk', defaultValue: 0)
  final int pk;
  @JsonKey(name: 'username',)
  final String userName;
  @JsonKey(name: 'last_name',)
  final String lastName;
  @JsonKey(name: 'first_name', )
  final String firstName;
  @JsonKey(name: 'middle_name',)
  final String middleName;
  @JsonKey(name: 'phone',)
  final String phone;
  @JsonKey(name: 'role',)
  final int role;

  const UserModel(
      { this.phone='',
        this.firstName='',
        this.pk=0,
        this.lastName='',
        this.middleName='',
        this.role=0,
        this.userName=''});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
