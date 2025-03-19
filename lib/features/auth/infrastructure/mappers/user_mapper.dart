import 'package:products_app/features/auth/domain/entities/user.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
    id: json['id'],
    fullName: json['fullName'],
    email: json['email'],
    token: json['token'],
    roles: List<String>.from(json['roles'].map((role) => role)),
  );
}
