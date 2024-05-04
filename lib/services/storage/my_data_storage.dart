import '../../helpers/helper_log.dart';

class MyDataStorage {
  MyDataStorage._internal();

  static final MyDataStorage singleton = MyDataStorage._internal();

  int? userId;

  String? lastName;

  String? firstName;

  String? email;

  dynamic gender;

  String? interests;

  int? location;

  String? dateOfBirth;

  String? refreshToken;

  String? languageId;

  String? password;

  String? createdDate;

  int? isActive;

  MyDataStorage({
    this.userId,
    this.lastName,
    this.firstName,
    this.email,
    this.gender,
    this.interests,
    this.location,
    this.dateOfBirth,
    this.refreshToken,
    this.languageId,
    this.password,
    this.createdDate,
    this.isActive,
  });

  void fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    userId = json['user_id'];
    createdDate = json['created_date'];
    isActive = json['is_active'];

    HelperLog.showLTest('MyDataStorage.fromJson: ${email}');
    return null;
  }
}
