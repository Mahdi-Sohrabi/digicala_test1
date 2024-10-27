import 'package:digicala_test1/data/Repository/authentication_repository.dart';
import 'package:digicala_test1/data/datasource/repasitory/authentication_datasource.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://startflutter.ir/api/')));

  //datasources
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());

  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
}
