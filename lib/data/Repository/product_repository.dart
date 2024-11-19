import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/datasource/product_datasurce.dart';
import 'package:digicala_test1/data/model/product.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getProducts();
}

class ProductRepository extends IProductRepository {
  final IProductDatasurse _datasource = locator.get();
  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      var response = await _datasource.getProduct();
      return right(response);
    } on apiException catch (ex) {
      return left(ex.message ?? 'خطا متوای متنی ندارد');
    }
  }
}
