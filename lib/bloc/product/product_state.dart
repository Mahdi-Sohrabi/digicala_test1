import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/model/product_image.dart';
import 'package:digicala_test1/data/model/product_variant.dart';

abstract class ProductState {}

class ProductInititeState extends ProductState {}

class ProductDietailLoadingState extends ProductState {}

class ProductDietailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImage;
  Either<String, List<ProductVarint>> productVariant;

  ProductDietailResponseState(this.productImage, this.productVariant);
}
