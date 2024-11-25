import 'package:digicala_test1/data/model/product.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';
import 'package:dio/dio.dart';

abstract class IProductDatasurse {
  Future<List<Product>> getProduct();
  Future<List<Product>> getHotest();
  Future<List<Product>> getBestSeller();
}

class ProductRemoteDataSource extends IProductDatasurse {
  final Dio _dio = locator.get();
  @override
  Future<List<Product>> getProduct() async {
    try {
      var response = await _dio.get('collections/products/records');
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown Error');
    }
  }

  @override
  Future<List<Product>> getBestSeller() async {
    try {
      Map<String, String> qPramas = {'filter': 'popularity="Hotest"'};
      var response = await _dio.get(
        'collections/products/records',
        queryParameters: qPramas,
      );
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown Error');
    }
  }

  @override
  Future<List<Product>> getHotest() async {
    try {
      Map<String, String> qPramas = {'filter': 'popularity="Best Seller"'};
      var response = await _dio.get(
        'collections/products/records',
        queryParameters: qPramas,
      );
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown Error');
    }
  }
}
