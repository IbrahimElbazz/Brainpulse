class RegisterModel {
  String? email;
  String? password;
  String? phone;
  String? firstName;
  String? lastName;

  RegisterModel(
      {this.email, this.password, this.phone, this.firstName, this.lastName});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}
