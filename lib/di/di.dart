import 'package:digicala_test1/data/Repository/authentication_repository.dart';
import 'package:digicala_test1/data/Repository/banner_repository.dart';
import 'package:digicala_test1/data/Repository/category_repository.dart';
import 'package:digicala_test1/data/datasource/authentication_datasource.dart';
import 'package:digicala_test1/data/datasource/banner_datasource.dart';
import 'package:digicala_test1/data/datasource/category_datasource.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //components
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://startflutter.ir/api/')));
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  //datasources
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());
  locator
      .registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());
  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());

  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
}
