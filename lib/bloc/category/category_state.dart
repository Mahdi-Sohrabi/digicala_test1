import 'package:dartz/dartz.dart';
import 'package:digicala_test1/data/model/category1.dart';

abstract class CategoryState {}

class CategoryInitState extends CategoryState {}

class CategoryResponseStete extends CategoryState {
  Either<String, List<Category1>> response;

  CategoryResponseStete(this.response);
}

class CategoryLodingState extends CategoryState {}
