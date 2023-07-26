class User{
  final int userId;
  final int id;
  final String title;

  User({required this.id,required this.title, required this.userId});

  factory User.fromJson(Map<String, dynamic> json){
    return User(id: json['id'], title: json['title'], userId: json['userId']);
  }
}