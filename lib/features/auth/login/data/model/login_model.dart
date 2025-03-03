class LoginModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String token;
  final int expire;
  final String refreshToken;
  final DateTime refreshTokenExpireOn;

  LoginModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.token,
    required this.expire,
    required this.refreshToken,
    required this.refreshTokenExpireOn,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      token: json['token'],
      expire: json['expire'],
      refreshToken: json['refreshToken'],
      refreshTokenExpireOn: DateTime.parse(json['refreshTokenExpireOn']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'token': token,
      'expire': expire,
      'refreshToken': refreshToken,
      'refreshTokenExpireOn': refreshTokenExpireOn.toIso8601String(),
    };
  }
}
