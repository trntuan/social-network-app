// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyDataStorage {
  MyDataStorage._internal();

  static final MyDataStorage singleton = MyDataStorage._internal();

  int? userId;

  String? token;

  String? displayName;

  String? email;

  dynamic gender;

  String? interests;

  int? location;

  String? dateOfBirth;

  String? languageId;

  String? password;

  String? createdDate;

  int? isActive;

  MyDataStorage({
    this.userId,
    this.displayName,
    this.email,
    this.gender,
    this.interests,
    this.location,
    this.dateOfBirth,
    this.languageId,
    this.password,
    this.createdDate,
    this.isActive,
    this.token,
  });

  // void fromJson(Map<String, dynamic>? json) {
  //   email = json['email'];
  //   password = json['password'];
  //   firstName = json['display_name'];
  //   gender = json['gender'];
  //   dateOfBirth = json['date_of_birth'];
  //   userId = json['user_id'];
  //   createdDate = json['created_date'];
  //   isActive = json['is_active'];
  //   token = json['token'];

  //   HelperLog.showLTest('MyDataStorage.fromJson: ${email}');
  //   return null;
  // }

  void fromMap(Map<String, dynamic>? map) {
    userId = map?['user_id'] != null ? map!['user_id'] as int : null;
    token = map?['token'] != null ? map!['token'] as String : null;
    displayName =
        map?['display_name'] != null ? map!['display_name'] as String : null;
    email = map?['email'] != null ? map!['email'] as String : null;
    gender = map?['gender'] as dynamic;
    interests = map?['interests'] != null ? map!['interests'] as String : null;
    location = map?['location'] != null ? map!['location'] as int : null;
    dateOfBirth =
        map?['date_of_birth'] != null ? map!['date_of_birth'] as String : null;
    languageId =
        map?['languageId'] != null ? map!['languageId'] as String : null;
    password = map?['password'] != null ? map!['password'] as String : null;
    createdDate =
        map?['created_date'] != null ? map!['created_date'] as String : null;
    isActive = map?['is_active'] != null ? map!['is_active'] as int : null;
  }

  MyDataStorage.fromJson(String source) {
    fromMap(json.decode(source) as Map<String, dynamic>);
  }
}
