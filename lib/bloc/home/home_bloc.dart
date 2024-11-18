import 'package:bloc/bloc.dart';
import 'package:digicala_test1/bloc/home/home_event.dart';
import 'package:digicala_test1/bloc/home/home_state.dart';
import 'package:digicala_test1/data/Repository/banner_repository.dart';
import 'package:digicala_test1/data/Repository/category_repository.dart';
import 'package:digicala_test1/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitializeDeta>((event, emit) async {
      emit(HomeLodingState());
      var bannerList = await _bannerRepository.getBanners();
      var categoryList = await _categoryRepository.getCategorys();
      emit(HomeRequestSccessState(bannerList, categoryList));
    });
  }
}
