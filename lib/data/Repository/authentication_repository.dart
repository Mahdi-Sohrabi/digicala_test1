import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/datasource/authentication_datasource.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';
import 'package:digicala_test1/util/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> rgister(
      String username, String password, String passwordConfirm);

  Future<Either<String, String>> login(String username, String password);
}

class AuthenticationRepository extends IAuthRepository {
  final IAuthenticationDatasource _datasource = locator.get();
  // ignore: unused_field
  final SharedPreferences _sharedPref = locator.get();
  @override
  Future<Either<String, String>> rgister(
      String username, String password, String passwordConfirm) async {
    try {
      await _datasource.regster('mahdi0915_13', '12345678', '12345678');
      return right('ثبتنام انجام شد!');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _datasource.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('شما وارد شدید');
      } else {
        return left('خطایی در ورود پیش آمده');
      }
    } on ApiException catch (ex) {
      return left('${ex.message}');
    }
  }
}
