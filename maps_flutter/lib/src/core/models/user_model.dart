import 'package:json_annotation/json_annotation.dart';
// flutter packages pub run build_runner build
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({this.id, this.name, this.email, this.username});
  
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  final int id;
  final String name;
  final String email;
  final String username;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
