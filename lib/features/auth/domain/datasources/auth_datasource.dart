import 'package:products_app/features/auth/domain/entities/user.dart';

abstract class AuthDatasource {
  Future<User> login(String mail, String password);
  Future<User> register(String mail, String password);
  Future<User> checkAuthStatus(String token);
}
