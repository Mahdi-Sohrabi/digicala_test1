import 'package:digicala_test1/data/datasource/repasitory/authentication_datasource.dart';
import 'package:digicala_test1/di/di.dart';

class AuthenticationRepository {
  final AuthenticationRemote datasource = locator.get();
}
