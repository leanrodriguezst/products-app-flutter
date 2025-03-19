import 'package:products_app/features/auth/domain/datasources/auth_datasource.dart';
import 'package:products_app/features/auth/domain/entities/user.dart';
import 'package:products_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:products_app/features/auth/infrastructure/datasources/auth_datasource_impl.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource dataSource;

  AuthRepositoryImpl({AuthDatasource? dataSource})
    : dataSource = dataSource ?? AuthDatasourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String mail, String password) {
    return dataSource.login(mail, password);
  }

  @override
  Future<User> register(String mail, String password) {
    return dataSource.register(mail, password);
  }
}
