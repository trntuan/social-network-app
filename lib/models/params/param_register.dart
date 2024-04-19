class ParamRegister {
  String email;
  String password;
  String firstName;
  String lastName;

  ParamRegister({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['fist_name'] = firstName;
    data['fist_name'] = lastName;
    return data;
  }
}
