import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/datasource/product_detail_datasuoce.dart';
import 'package:digicala_test1/data/model/product_image.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';

abstract class IDetailProductRepository {
  Future<Either<String, List<ProductImage>>> getProductImage();
}

class DetailProductRepository extends IDetailProductRepository {
  @override
  Future<Either<String, List<ProductImage>>> getProductImage() async {
    final IDetailProductDatasuoce _datasource = locator.get();
    try {
      var response = await _datasource.getGallery();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا متوای متنی ندارد');
    }
  }
}
