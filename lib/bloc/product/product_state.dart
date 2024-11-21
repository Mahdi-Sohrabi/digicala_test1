import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/model/product_image.dart';

abstract class ProductState {}

class ProductInititeState extends ProductState {}

class ProductDietailLoadingState extends ProductState {}

class ProductDietailResponseState extends ProductState {
  Either<String, List<ProductImage>> getProductImage;

  ProductDietailResponseState(this.getProductImage);
}
