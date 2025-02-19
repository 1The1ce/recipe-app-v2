import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/data/repositories/auth_repository.dart';

import '../main.dart';

class AuthInterceptor extends Interceptor {
  late AuthRepository _repo;
  final Dio _dio = Dio();

  AuthInterceptor()  {
    _repo = navigatorKey.currentContext!.read<AuthRepository>();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final jwt = _repo.jwt;
    if (jwt != null) {
      options.headers['Authorization'] = "Bearer $jwt";
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final success = await _repo.refreshToken();
      if (success) {
        err.requestOptions.headers['Authorization'] = "Bearer ${_repo.jwt}";
        return handler.resolve(
          await _dio.request(
            err.requestOptions.baseUrl + err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          ),
        );
      } else {
        await _repo.logout();
        navigatorKey.currentContext!.go('/login');
        return handler.reject(err);
      }
    }
  }
}
