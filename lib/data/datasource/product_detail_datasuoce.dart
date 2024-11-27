import 'package:digicala_test1/data/model/category1.dart';
import 'package:digicala_test1/data/model/product_image.dart';
import 'package:digicala_test1/data/model/product_variant.dart';
import 'package:digicala_test1/data/model/variant.dart';
import 'package:digicala_test1/data/model/variant_type.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';
import 'package:dio/dio.dart';

abstract class IDetailProductDatasuoce {
  Future<List<ProductImage>> getGallery(String PorductId);
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant();
  Future<List<ProductVarint>> getProductVariants();
  Future<Category1> getProductCategory(String CategoryId);
}

class DetailProductRemoteDatasuoce extends IDetailProductDatasuoce {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImage>> getGallery(String PorductId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$PorductId"'};
      var respones = await _dio.get('collections/gallery/records',
          queryParameters: qParams);

      return respones.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromjson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      var respones = await _dio.get('collections/variants_type/records');

      return respones.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromjson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<Variant>> getVariant() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="5vvww65pv6nviw6"'};

      var respones = await _dio.get('collections/variants/records',
          queryParameters: qParams);

      return respones.data['items']
          .map<Variant>((jsonObject) => Variant.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<ProductVarint>> getProductVariants() async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariant();

    List<ProductVarint> productVariantList = [];

    try {
      for (var variantType in variantTypeList) {
        var variant = variantList
            .where((element) => element.typeId == variantType.id)
            .toList();
        productVariantList.add(ProductVarint(variantType, variant));
      }

      return productVariantList;
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<Category1> getProductCategory(String categoryId) async {
    try {
      Map<String, String> qParams = {'filter': 'id="$categoryId"'};
      var respones = await _dio.get('collections/category/records',
          queryParameters: qParams);
      return Category1.fromMapJson(respones.data['items'][0]);
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
