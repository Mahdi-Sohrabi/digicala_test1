import 'package:bloc/bloc.dart';
import 'package:digicala_test1/bloc/category/category_event.dart';
import 'package:digicala_test1/bloc/category/category_state.dart';
import 'package:digicala_test1/data/Repository/category_repository.dart';
import 'package:digicala_test1/di/di.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _repository = locator();
  CategoryBloc() : super(CategoryInitState()) {
    on<CategoryRequestList>((event, emit) async {
      emit(CategoryLodingState());
      var response = await _repository.getCategorys();
      emit(CategoryResponseStete(response));
    });
  }
}
