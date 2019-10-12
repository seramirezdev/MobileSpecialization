import 'package:json_annotation/json_annotation.dart';
import 'package:maps_flutter/src/core/models/user_model.dart';

part 'place_model.g.dart';

@JsonSerializable()
class PlaceModel {
  PlaceModel({this.id, this.name, this.user, this.user2});
  factory PlaceModel.fromJson(Map<String, dynamic> json) => _$PlaceModelFromJson(json);

  final int id;
  final String name;
  final UserModel user;
  final UserModel user2;

  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);
}