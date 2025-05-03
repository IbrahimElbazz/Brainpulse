class LoginModel {
  final String token;
  final String? userName;

  LoginModel({
    required this.token,
    this.userName,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      userName: json['userName'],
    );
  }
}
