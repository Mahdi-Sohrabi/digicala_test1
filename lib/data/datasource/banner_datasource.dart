import 'package:digicala_test1/data/model/banner.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';
import 'package:dio/dio.dart';

abstract class IBannerDatasource {
  Future<List<BannerCampain>> getBanners();
}

class BannerRemoteDatasource extends IBannerDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerCampain>> getBanners() async {
    try {
      var response = await _dio.get('collections/banner/records');
      return response.data['items']
          .map<BannerCampain>(
              (jsonObject) => BannerCampain.fromJson(jsonObject))
          .toList();
      // ignore: deprecated_member_use
    } on DioError catch (ex) {
      throw apiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw apiException(0, 'unknown Error');
    }
  }
}
