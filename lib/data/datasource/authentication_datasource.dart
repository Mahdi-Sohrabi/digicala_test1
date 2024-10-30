import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';
import 'package:dio/dio.dart';

abstract class IAuthenticationDatasource {
  Future<void> regster(
      String username, String password, String passwordConfirm);

  Future<String> login(String username, String password);
}

class AuthenticationRemote implements IAuthenticationDatasource {
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
      // ignore: avoid_print
      print('${response.statusCode}');
      // ignore: deprecated_member_use
    } on DioError catch (ex) {
      throw apiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw apiException(0, 'unknown Error');
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      // ignore: unused_local_variable
      var respose =
          await _dio.post('collections/users/auth-with-password', data: {
        'identity': username,
        'password': password,
      });
      if (respose.statusCode == 200) {
        return respose.data?['token'];
      } else {}
      // ignore: deprecated_member_use
    } on DioError catch (ex) {
      throw apiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw apiException(0, 'unknown Error');
    }
    return '';
  }
}
