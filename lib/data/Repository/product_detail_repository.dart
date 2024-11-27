import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/datasource/product_detail_datasuoce.dart';
import 'package:digicala_test1/data/model/category1.dart';
import 'package:digicala_test1/data/model/product_image.dart';
import 'package:digicala_test1/data/model/product_variant.dart';
import 'package:digicala_test1/data/model/variant_type.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';

abstract class IDetailProductRepository {
  Future<Either<String, List<ProductImage>>> getProductImage(String PorductId);
  Future<Either<String, List<VariantType>>> getVariantTypes();
  Future<Either<String, List<ProductVarint>>> getProductVariants();
  Future<Either<String, Category1>> getProductCategory(String categoryId);
}

class DetailProductRepository extends IDetailProductRepository {
  final IDetailProductDatasuoce _datasource = locator.get();
  @override
  Future<Either<String, List<ProductImage>>> getProductImage(
      String PorductId) async {
    try {
      var response = await _datasource.getGallery(PorductId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا متوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<VariantType>>> getVariantTypes() async {
    try {
      var response = await _datasource.getVariantTypes();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductVarint>>> getProductVariants() async {
    try {
      var response = await _datasource.getProductVariants();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا متوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, Category1>> getProductCategory(
      String categoryId) async {
    try {
      var response = await _datasource.getProductCategory(categoryId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا متوای متنی ندارد');
    }
  }
}
