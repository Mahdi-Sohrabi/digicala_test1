import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/model/banner.dart';

abstract class HomeState {}

class HomeLodingState extends HomeState {}

class HomeInitState extends HomeState {}

class HomeRequestSccessState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;
  HomeRequestSccessState(this.bannerList);
}
