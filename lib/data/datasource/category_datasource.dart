import 'package:digicala_test1/data/model/category1.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDatasource {
  Future<List<Category1>> getGategories();
}

class CategoryRemoteDatasource extends ICategoryDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Category1>> getGategories() async {
    try {
      var response = await _dio.get('collections/category/records');
      return response.data['items']
          .map<Category1>((jsonObject) => Category1.fromMapJson(jsonObject))
          .toList();
      // ignore: deprecated_member_use
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown Error');
    }
  }
}
