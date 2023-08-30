class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String jobTitle;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.id,
      required this.jobTitle});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json["firstName"] as String? ?? "",
        lastName: json["lastName"] as String? ?? "",
        jobTitle: json["jobTitle"] as String? ?? "",
        id: json["id"] as int? ?? 0,
        age: json["age"] as int? ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "age": age,
      "jobTitle": jobTitle
    };
  }

  @override
  String toString() {
    return """
      "id": $id,
      "firstName": $firstName,
      "lastName": $lastName,
      "age": $age,
      "jobTitle": $jobTitle
    """;
  }
}
