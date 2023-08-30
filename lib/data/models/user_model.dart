class UserFields {
  static const String id = "id";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String gender = "gander";
  static const String jobTitle = "jobTitle";
  static const String age = "age";

  static const String userTable = "userTable";
}

class UserModel {
  int? id;
  String firstName;
  String lastName;
  String gender;
  String jobTitle;
  int age;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.jobTitle,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? gander,
    String? jobTitle,
    int? age,
    int? id,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gander ?? this.gender,
      jobTitle: jobTitle ?? this.jobTitle,
      id: id ?? this.id,
      age: age ?? this.age,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData[UserFields.id] ?? 0,
      age: jsonData[UserFields.age] ?? 0,
      firstName: jsonData[UserFields.firstName] as String? ??"",
      lastName: jsonData[UserFields.lastName] as String? ?? "",
      gender: jsonData[UserFields.gender] as String? ?? '',
      jobTitle: jsonData[UserFields.jobTitle] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserFields.firstName: firstName,
      UserFields.lastName: lastName,
      UserFields.gender: gender,
      UserFields.jobTitle: jobTitle,
      UserFields.age: age,
    };
  }

  @override
  String toString() {
    return ''''
       firstName : $firstName,
       lastName : $lastName,
       gander : $gender,
       jobTitle : $jobTitle,
       id: $id, 
       age: $age, 
      ''';
  }
}