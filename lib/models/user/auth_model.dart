class Auth {
  final String firstname;
  final String lastname;

  Auth({required this.firstname, required this.lastname});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(firstname: json['firstname']as String? ?? '', lastname: json['lastname']as String? ?? '');
  }
}
