import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/model/banner.dart';
import 'package:digicala_test1/data/model/category1.dart';

abstract class HomeState {}

class HomeLodingState extends HomeState {}

class HomeInitState extends HomeState {}

class HomeRequestSccessState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;
  Either<String, List<Category1>> categoryList;
  HomeRequestSccessState(this.bannerList, this.categoryList);
}