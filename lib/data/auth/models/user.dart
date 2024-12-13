class UserModel {
  final String id;
  final String email;
  final String image;
  final String token;

  UserModel({
    required this.id,
    required this.email,
    required this.image,
    required this.token,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      token: map['token'] as String,
    );
  }
}
