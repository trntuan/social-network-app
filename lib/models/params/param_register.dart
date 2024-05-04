class ParamRegister {
  String email;
  String password;
  String firstName;
  int? gender;
  String lastName;
  String dateOfBirth;

  ParamRegister({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dateOfBirth,
  });

  Map<String, String> toJson() {
    final Map<String, String> data = {
      "email": "$email",
      "password": "$password",
      "first_name": "$firstName",
      "last_name": '$lastName',
      "gender": "$gender",
      "date_of_birth": "$dateOfBirth",
    };

    return data;
  }
}
