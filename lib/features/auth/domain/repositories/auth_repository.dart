import 'package:products_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String mail, String password);
  Future<User> register(String mail, String password);
  Future<User> checkAuthStatus(String token);
}
