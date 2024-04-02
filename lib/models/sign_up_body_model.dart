class SignUpBody{
  String login;
  String password;

  SignUpBody({
    required this.login,
    required this.password
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = this.login;
    data["password"] = this.password;
    return data;
  }
}