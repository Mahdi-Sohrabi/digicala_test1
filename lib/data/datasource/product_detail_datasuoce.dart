import 'package:digicala_test1/data/model/product_image.dart';
import 'package:digicala_test1/data/model/product_variant.dart';
import 'package:digicala_test1/data/model/variant.dart';
import 'package:digicala_test1/data/model/variant_type.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';
import 'package:dio/dio.dart';

abstract class IDetailProductDatasuoce {
  Future<List<ProductImage>> getGallery();
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant();
  Future<List<ProductVarint>> getProductVariants();
}

class DetailProductRemoteDatasuoce extends IDetailProductDatasuoce {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImage>> getGallery() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="78n4wqor3hhnkju"'};
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
      Map<String, String> qParams = {'filter': 'product_id="at0y1gm0t65j62j"'};

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
}
