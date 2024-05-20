class ParamRegister {
  String email;
  String password;
  String displayName;
  int? gender;
  String dateOfBirth;

  ParamRegister({
    required this.email,
    required this.password,
    required this.displayName,
    required this.gender,
    required this.dateOfBirth,
  });

  Map<String, String> toJson() {
    final Map<String, String> data = {
      "email": "$email",
      "password": "$password",
      "display_name": "$displayName",
      "gender": "$gender",
      "date_of_birth": "$dateOfBirth",
    };

    return data;
  }
}
