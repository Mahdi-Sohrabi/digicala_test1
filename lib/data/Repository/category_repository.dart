import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/datasource/category_datasource.dart';
import 'package:digicala_test1/data/model/category1.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/util/apiException.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category1>>> getCategorys();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Category1>>> getCategorys() async {
    try {
      var response = await _datasource.getGategories();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا متوای متنی ندارد');
    }
  }
}
