class User {
  String name;
  String email;
  String phone;
  String password;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "phone": phone, "password": password};
}
