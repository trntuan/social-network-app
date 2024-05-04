class ParamLogin {
  String email;
  String password;

  ParamLogin({
    required this.email,
    required this.password,
  });

  Map<String, String> toJson() {
    final Map<String, String> data = {
      "email": "$email",
      "password": "$password",
    };

    return data;
  }
}
