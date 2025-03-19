import 'dart:async';

import 'package:dio/dio.dart';
import 'package:products_app/core/constants/environment.dart';
import 'package:products_app/features/auth/domain/datasources/auth_datasource.dart';
import 'package:products_app/features/auth/domain/entities/user.dart';
import 'package:products_app/features/auth/infrastructure/errors/auth_errors.dart';
import 'package:products_app/features/auth/infrastructure/mappers/user_mapper.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get(
        '/auth/check-status',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Wrong token');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Connection timeout');
      }
      throw CustomError('Something wrong happened');
    } catch (e) {
      throw CustomError('Something wrong happened');
    }
  }

  @override
  Future<User> login(String mail, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'email': mail, 'password': password},
      );
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Credentials are wrong');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Connection timeout');
      }
      throw CustomError('Something wrong happened');
    } catch (e) {
      throw CustomError('Something wrong happened');
    }
  }

  @override
  Future<User> register(String mail, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
