class User {
  final String id;
  final String name;
  final int age;
  final String imageName;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.imageName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      imageName: json['imageName'],
    );
  }
}
