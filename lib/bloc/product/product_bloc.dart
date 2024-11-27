import 'package:bloc/bloc.dart';
import 'package:digicala_test1/bloc/product/product_event.dart';
import 'package:digicala_test1/bloc/product/product_state.dart';
import 'package:digicala_test1/data/Repository/product_detail_repository.dart';
import 'package:digicala_test1/di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IDetailProductRepository _productRepository = locator.get();
  ProductBloc() : super(ProductInititeState()) {
    on<ProductInitalizeEvent>(
      (event, emit) async {
        emit(ProductDietailLoadingState());

        var productImage =
            await _productRepository.getProductImage(event.productId);

        var productVariant = await _productRepository.getProductVariants();
        var productCategory =
            await _productRepository.getProductCategory(event.categoryId);

        emit(ProductDietailResponseState(
          productImage,
          productVariant,
          productCategory,
        ));
      },
    );
  }
}
