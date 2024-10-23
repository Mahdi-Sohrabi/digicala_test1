import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';
import 'package:dio/dio.dart';

abstract class IAuthentication {
  Future<void> regster(
      String username, String password, String passwordConfirm);
}

class AuthenticationRemote implements IAuthentication {
  final Dio _dio = locator.get();

  @override
  Future<void> regster(
      String username, String password, String passwordConfirm) async {
    try {
      final response = await _dio.post(
        'collections/users/records',
        data: {
          'username': username,
          'password': password,
          'passwordConfirm': passwordConfirm,
        },
      );
      print('${response.statusCode}');
      // ignore: deprecated_member_use
    } on DioError catch (ex) {
      throw apiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw apiException(0, 'unknown Error');
    }
  }
}
