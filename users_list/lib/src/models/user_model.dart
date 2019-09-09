import 'package:flutter/foundation.dart';

class UserModel {
  String name;
  String occupation;
  int years;
  DateTime date;

  UserModel({@required this.name, this.occupation, this.years, this.date})
      : assert(name != null),
        assert(name.length > 0),
        assert(years < 2019) {
    if (date == null) {
      this.date = DateTime.now();
    }
  }
}

var users = <UserModel>[
  UserModel(
      name: "Sergio",
      occupation: "Instructor",
      years: 3,
      date: DateTime(2017, 9, 2)),
  UserModel(
      name: "Jose",
      occupation: "Developer",
      years: 4,
      date: DateTime(2016, 9, 2)),
  UserModel(
      name: "Juan",
      occupation: "Architect",
      years: 3,
      date: DateTime(2017, 2, 15)),
];
